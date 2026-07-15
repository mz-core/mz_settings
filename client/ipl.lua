local cayoRadarRunning = false
local requestedIpls = {}
local removedIpls = {}
local activeCatalogEntries = {}
local iplReferences = {}
local validationRun = 0

local validTypes = {
  world = true,
  teleport = true,
  ipl = true,
  ipl_entitysets = true,
  map_toggle = true
}

local knownFields = {
  enabled = true, label = true, category = true, type = true, gameBuild = true,
  source = true, load = true, remove = true, outside = true, inside = true,
  interiorId = true, interior = true, needsRoutingBucket = true,
  overlapGroup = true, activeVariant = true, variants = true, entitySets = true,
  disableProps = true, props = true, colors = true, notes = true, tags = true,
  managedBy = true, conflictsWith = true
}

local function debug(message)
  if MZSettings and MZSettings.Debug then
    MZSettings.Debug(message)
  end
end

local function warn(message)
  print(('[mz_settings] AVISO IPL: %s'):format(tostring(message)))
end

local function isEnabled(entry)
  return type(entry) == 'table' and entry.enabled == true
end

local function listHasValues(list)
  return type(list) == 'table' and next(list) ~= nil
end

local function eachIpl(list, callback)
  if type(list) ~= 'table' then return end

  for _, ipl in ipairs(list) do
    if type(ipl) == 'string' and ipl ~= '' then
      callback(ipl)
    end
  end
end

local function selectedVariant(entry, sourceName)
  if type(entry) ~= 'table' or entry.activeVariant == nil then return nil end

  local variant = type(entry.variants) == 'table' and entry.variants[entry.activeVariant] or nil
  if type(variant) ~= 'table' then
    warn(('%s: variante ativa inexistente: %s'):format(sourceName, tostring(entry.activeVariant)))
    return nil
  end

  return variant
end

local function addPlanEntry(plan, entry, sourceName, allowManaged)
  if not isEnabled(entry) then return end

  if entry.managedBy and allowManaged ~= true then
    debug(('%s é informativo e gerenciado por %s'):format(sourceName, tostring(entry.managedBy)))
    return
  end

  if entry.type == 'world' or entry.type == 'teleport' then
    return
  end

  plan.entries[#plan.entries + 1] = { name = sourceName, entry = entry }

  eachIpl(entry.load, function(ipl)
    if not plan.load[ipl] then plan.loadOrder[#plan.loadOrder + 1] = ipl end
    plan.load[ipl] = true
    plan.references[ipl] = (plan.references[ipl] or 0) + 1
    plan.loadSources[ipl] = plan.loadSources[ipl] or {}
    plan.loadSources[ipl][sourceName] = true
  end)

  eachIpl(entry.remove, function(ipl)
    if not plan.remove[ipl] then plan.removeOrder[#plan.removeOrder + 1] = ipl end
    plan.remove[ipl] = true
    plan.removeSources[ipl] = plan.removeSources[ipl] or {}
    plan.removeSources[ipl][sourceName] = true
  end)

  local variant = selectedVariant(entry, sourceName)
  if variant then
    eachIpl(variant.load, function(ipl)
      if not plan.load[ipl] then plan.loadOrder[#plan.loadOrder + 1] = ipl end
      plan.load[ipl] = true
      plan.references[ipl] = (plan.references[ipl] or 0) + 1
      plan.loadSources[ipl] = plan.loadSources[ipl] or {}
      plan.loadSources[ipl][sourceName .. ':' .. tostring(entry.activeVariant)] = true
    end)
    eachIpl(variant.remove, function(ipl)
      if not plan.remove[ipl] then plan.removeOrder[#plan.removeOrder + 1] = ipl end
      plan.remove[ipl] = true
      plan.removeSources[ipl] = plan.removeSources[ipl] or {}
      plan.removeSources[ipl][sourceName .. ':' .. tostring(entry.activeVariant)] = true
    end)
  end
end

local function buildPlan()
  local cfg = Config.IPL or {}
  local plan = {
    load = {}, remove = {}, references = {}, loadSources = {}, removeSources = {},
    loadOrder = {}, removeOrder = {}, entries = {}, catalog = {}
  }

  local manual = { enabled = true, load = cfg.load, remove = cfg.remove }
  addPlanEntry(plan, manual, 'manual', true)

  for groupName, group in pairs(cfg.groups or {}) do
    addPlanEntry(plan, group, 'grupo:' .. tostring(groupName), true)
  end

  for key, entry in pairs(Config.IPLCatalog or {}) do
    if isEnabled(entry) and not entry.managedBy then
      addPlanEntry(plan, entry, 'catalogo:' .. tostring(key), false)
      plan.catalog[key] = entry
    elseif isEnabled(entry) and entry.managedBy then
      debug(('catálogo %s não duplicado; gerenciado por %s'):format(key, tostring(entry.managedBy)))
    end
  end

  return plan
end

local function applyPlan(plan)
  requestedIpls = {}
  removedIpls = {}
  activeCatalogEntries = plan.catalog
  iplReferences = plan.references

  -- Todos os removes são processados antes dos loads. Uma referência ativa vence.
  for _, ipl in ipairs(plan.removeOrder) do
    if (plan.references[ipl] or 0) > 0 then
      debug(('remoção ignorada, IPL ainda referenciado: %s'):format(ipl))
    else
      RemoveIpl(ipl)
      removedIpls[ipl] = true
      debug(('IPL removido: %s'):format(ipl))
    end
  end

  for _, ipl in ipairs(plan.loadOrder) do
    RequestIpl(ipl)
    requestedIpls[ipl] = true
    debug(('IPL carregado (%d referência(s)): %s'):format(plan.references[ipl] or 1, ipl))
  end
end

local function coordinateValues(coords)
  if coords == nil then return nil end

  local ok, x, y, z, w = pcall(function()
    return tonumber(coords.x or coords[1]), tonumber(coords.y or coords[2]),
      tonumber(coords.z or coords[3]), tonumber(coords.w or coords[4])
  end)

  if not ok or not x or not y or not z then return nil end
  return x, y, z, w or 0.0
end

local function resolveInteriorId(entry)
  if type(entry) ~= 'table' then return nil end

  local direct = entry.interiorId or entry.interior
  if type(direct) == 'number' then return direct end

  local coords = entry.coords
  if type(entry.inside) == 'table' and entry.inside.coords ~= nil then
    coords = entry.inside.coords
  end

  local x, y, z = coordinateValues(coords)
  if x then return GetInteriorAtCoords(x, y, z) end
  return nil
end

local function applyLegacyInterior(name, entry)
  if not isEnabled(entry) then return end

  local interiorId = resolveInteriorId(entry)
  if not interiorId or interiorId == 0 or not IsValidInterior(interiorId) then
    warn(('interior legado inválido ou não carregado [%s]'):format(name))
    return
  end

  for _, prop in ipairs(entry.disableProps or {}) do
    if type(prop) == 'string' and prop ~= '' then DisableInteriorProp(interiorId, prop) end
  end

  for _, prop in ipairs(entry.props or {}) do
    if type(prop) == 'string' and prop ~= '' then
      EnableInteriorProp(interiorId, prop)
      if entry.colors and entry.colors[prop] ~= nil then
        SetInteriorPropColor(interiorId, prop, entry.colors[prop])
      end
    end
  end

  RefreshInterior(interiorId)
  debug(('props aplicados [%s]: %s'):format(name, interiorId))
end

local function applyEntitySets(sourceName, entry, entitySets)
  if not listHasValues(entitySets) then return end

  local interiorId = resolveInteriorId(entry)
  if not interiorId or interiorId == 0 or not IsValidInterior(interiorId) then
    warn(('entity sets ignorados; interior inválido [%s]'):format(sourceName))
    return
  end

  for _, entitySet in ipairs(entitySets) do
    if type(entitySet) == 'table' and type(entitySet.name) == 'string' and entitySet.name ~= '' then
      if entitySet.enabled == false then
        DeactivateInteriorEntitySet(interiorId, entitySet.name)
      else
        ActivateInteriorEntitySet(interiorId, entitySet.name)
        if entitySet.color ~= nil then
          SetInteriorEntitySetColor(interiorId, entitySet.name, entitySet.color)
        end
      end
    end
  end

  RefreshInterior(interiorId)
end

local function applyInteriors(plan)
  for name, entry in pairs((Config.IPL or {}).interiors or {}) do
    applyLegacyInterior(name, entry)
  end

  for key, entry in pairs(plan.catalog) do
    applyEntitySets('catalogo:' .. key, entry, entry.entitySets)
    local variant = selectedVariant(entry, 'catalogo:' .. key)
    if variant then applyEntitySets('catalogo:' .. key, entry, variant.entitySets) end
  end
end

local function applyIPL()
  local cfg = Config.IPL or {}
  if cfg.enabled ~= true then return end

  if cfg.externalLoader ~= nil and cfg.externalLoader ~= 'native' then
    warn(('externalLoader=%s não é implementado; nenhuma API externa será chamada'):format(tostring(cfg.externalLoader)))
    return
  end

  if cfg.loadMpDlcMaps == true then LoadMpDlcMaps() end
  if cfg.enableMpDlcMaps == true then EnableMpDlcMaps(true) end

  local plan = buildPlan()
  applyPlan(plan)

  local delay = tonumber(cfg.interiorApplyDelayMs) or 250
  if delay > 0 then Wait(delay) end
  applyInteriors(plan)
end

local function shouldRunCayoRadar()
  local cfg = Config.IPL or {}
  local radar = cfg.cayoRadar or {}
  local cayo = (cfg.groups or {}).cayo_perico or {}
  return cfg.enabled == true and radar.enabled == true and cayo.enabled == true
end

local function startCayoRadarThread()
  if cayoRadarRunning then return end
  cayoRadarRunning = true

  CreateThread(function()
    while cayoRadarRunning do
      if shouldRunCayoRadar() then
        local radar = Config.IPL.cayoRadar or {}
        local interior = radar.interior or 'h4_fake_islandx'
        local interiorHash = type(interior) == 'string' and GetHashKey(interior) or interior
        SetRadarAsExteriorThisFrame()
        SetRadarAsInteriorThisFrame(interiorHash, tonumber(radar.x) or 4700.0,
          tonumber(radar.y) or -5145.0, tonumber(radar.heading) or 0, 0)
        Wait(0)
      else
        Wait(1000)
      end
    end
  end)
end

local function validateList(sourceName, list, otherList, warnings, loads, removes)
  local seen = {}
  eachIpl(list, function(ipl)
    if seen[ipl] then warnings[#warnings + 1] = sourceName .. ': IPL repetido: ' .. ipl end
    seen[ipl] = true
    if otherList and otherList[ipl] then warnings[#warnings + 1] = sourceName .. ': IPL em load e remove: ' .. ipl end
  end)

  for ipl in pairs(seen) do
    local target = loads or removes
    if target then
      target[ipl] = target[ipl] or {}
      target[ipl][sourceName] = true
    end
  end
end

local function validateEntry(sourceName, entry, warnings, enabledOverlaps, loads, removes)
  if type(entry) ~= 'table' then
    warnings[#warnings + 1] = sourceName .. ': entrada não é tabela'
    return
  end

  local removeLookup = {}
  eachIpl(entry.remove, function(ipl) removeLookup[ipl] = true end)
  validateList(sourceName .. '.load', entry.load, removeLookup, warnings, loads, nil)
  validateList(sourceName .. '.remove', entry.remove, nil, warnings, nil, removes)

  if entry.type and not validTypes[entry.type] then
    warnings[#warnings + 1] = sourceName .. ': tipo inválido: ' .. tostring(entry.type)
  end

  if entry.interiorId ~= nil and type(entry.interiorId) ~= 'number' then
    warnings[#warnings + 1] = sourceName .. ': interiorId deve ser número'
  end

  for _, field in ipairs({ 'inside', 'outside' }) do
    if type(entry[field]) == 'table' and entry[field].coords ~= nil and not coordinateValues(entry[field].coords) then
      warnings[#warnings + 1] = sourceName .. ': coordenada inválida em ' .. field
    end
  end

  if entry.type == 'teleport' and entry.inside == nil then
    warnings[#warnings + 1] = sourceName .. ': teleport sem inside (pendente)'
  end

  local variant = selectedVariant(entry, sourceName)
  if entry.activeVariant ~= nil and not variant then
    warnings[#warnings + 1] = sourceName .. ': activeVariant inexistente'
  end

  local activeVariantCount = 0
  for variantName, item in pairs(entry.variants or {}) do
    if type(item) == 'table' and item.enabled == true then activeVariantCount = activeVariantCount + 1 end
    local variantRemove = {}
    eachIpl(type(item) == 'table' and item.remove or nil, function(ipl) variantRemove[ipl] = true end)
    validateList(sourceName .. '.variants.' .. tostring(variantName) .. '.load', type(item) == 'table' and item.load or nil, variantRemove, warnings, loads, nil)
    validateList(sourceName .. '.variants.' .. tostring(variantName) .. '.remove', type(item) == 'table' and item.remove or nil, nil, warnings, nil, removes)
  end
  if activeVariantCount > 1 then warnings[#warnings + 1] = sourceName .. ': várias variantes marcadas enabled' end

  if isEnabled(entry) and entry.overlapGroup then
    enabledOverlaps[entry.overlapGroup] = enabledOverlaps[entry.overlapGroup] or {}
    enabledOverlaps[entry.overlapGroup][#enabledOverlaps[entry.overlapGroup] + 1] = sourceName
  end

  local sets = entry.entitySets
  if listHasValues(sets) and not entry.interiorId and not entry.interior and not entry.inside then
    warnings[#warnings + 1] = sourceName .. ': entity set sem interior'
  end

  if entry.type == 'ipl' and not entry.managedBy and not listHasValues(entry.load) and entry.activeVariant == nil then
    warnings[#warnings + 1] = sourceName .. ': entrada IPL sem load'
  end

  local propsSeen = {}
  for _, prop in ipairs(entry.props or {}) do
    if propsSeen[prop] then warnings[#warnings + 1] = sourceName .. ': prop repetido: ' .. tostring(prop) end
    propsSeen[prop] = true
  end

  for field in pairs(entry) do
    if not knownFields[field] then warnings[#warnings + 1] = sourceName .. ': campo conhecido sem uso: ' .. tostring(field) end
  end
end

local function runValidation(printDetails)
  validationRun = validationRun + 1
  local warnings, overlaps, loads, removes = {}, {}, {}, {}

  for key, count in pairs(Config.IPLCatalogDuplicates or {}) do
    warnings[#warnings + 1] = ('catálogo: chave duplicada %s (%d declarações)'):format(key, count)
  end

  for groupName, group in pairs((Config.IPL or {}).groups or {}) do
    validateEntry('grupo:' .. groupName, group, warnings, overlaps, loads, removes)
    if isEnabled(group) and not listHasValues(group.load) and not listHasValues(group.remove) and group.activeVariant == nil then
      warnings[#warnings + 1] = 'grupo:' .. groupName .. ': grupo ativo com listas vazias'
    end
  end

  for key, entry in pairs(Config.IPLCatalog or {}) do
    validateEntry('catalogo:' .. key, entry, warnings, overlaps, loads, removes)
    if isEnabled(entry) and entry.gameBuild and (Config.IPL or {}).serverGameBuild and entry.gameBuild > Config.IPL.serverGameBuild then
      warnings[#warnings + 1] = ('catalogo:%s exige build %d, configurada %d'):format(key, entry.gameBuild, Config.IPL.serverGameBuild)
    end
  end

  for group, sources in pairs(overlaps) do
    if #sources > 1 then warnings[#warnings + 1] = ('overlapGroup %s ativo em: %s'):format(group, table.concat(sources, ', ')) end
  end

  for ipl, loadSources in pairs(loads) do
    if removes[ipl] then
      local a, b = {}, {}
      for source in pairs(loadSources) do a[#a + 1] = source end
      for source in pairs(removes[ipl]) do b[#b + 1] = source end
      warnings[#warnings + 1] = ('IPL carregado por [%s] e removido por [%s]: %s'):format(table.concat(a, ', '), table.concat(b, ', '), ipl)
    end
    if ipl:match('interior_2_biker_dlc_int_ware0[2345]_milo') then
      warnings[#warnings + 1] = 'nome Biker suspeito: ' .. ipl
    end
    if ipl:match('%s$') then warnings[#warnings + 1] = 'nome IPL com espaço final: ' .. ipl end
  end

  local cayoLoad = {}
  eachIpl((((Config.IPL or {}).groups or {}).cayo_perico or {}).load, function(ipl) cayoLoad[ipl] = true end)
  for _, pair in ipairs({
    { 'h4_mansion_gate_closed', 'h4_mansion_gate_broken' },
    { 'h4_islandairstrip_doorsopen', 'h4_islandairstrip_doorsclosed' }
  }) do
    if cayoLoad[pair[1]] and cayoLoad[pair[2]] then
      warnings[#warnings + 1] = ('Cayo preserva estados incompatíveis: %s + %s'):format(pair[1], pair[2])
    end
  end

  local storyLookup = {}
  eachIpl((((Config.IPL or {}).groups or {}).story_interiors or {}).load, function(ipl) storyLookup[ipl] = true end)
  if storyLookup.TrevorsTrailerTidy and storyLookup.TrevorsTrailerTrash then
    warnings[#warnings + 1] = 'Trevor legado preserva Tidy + Trash; aguardando teste runtime'
  end

  local mapLookup = {}
  eachIpl((((Config.IPL or {}).groups or {}).map_fixes_story or {}).load, function(ipl) mapLookup[ipl] = true end)
  if mapLookup.bnkheist_apt_dest and mapLookup.bnkheist_apt_norm then
    warnings[#warnings + 1] = 'Heist apartment legado preserva destroyed + normal; aguardando teste runtime'
  end

  local limit = 80
  if printDetails then
    for index, message in ipairs(warnings) do
      if index > limit then
        warn(('mais %d warning(s) omitidos para limitar spam'):format(#warnings - limit))
        break
      end
      warn(message)
    end
  end

  print(('[mz_settings] validação IPL #%d: %d warning(s), %d entrada(s) de catálogo'):format(validationRun, #warnings, (function() local n = 0 for _ in pairs(Config.IPLCatalog or {}) do n = n + 1 end return n end)()))
  return warnings
end

local function formatCoords(container)
  if type(container) ~= 'table' then return 'nil' end
  local x, y, z, h = coordinateValues(container.coords)
  if not x then return 'nil' end
  return ('%.3f %.3f %.3f %.1f'):format(x, y, z, h)
end

local function printCatalogInfo(key, entry)
  print(('[mz_settings] %s'):format(key))
  print(('Tipo: %s | Ativo: %s | Build: %s'):format(tostring(entry.type), tostring(entry.enabled == true), tostring(entry.gameBuild or 'n/a')))
  print(('Inside: %s | Outside: %s'):format(formatCoords(entry.inside), formatCoords(entry.outside)))
  print(('Variante: %s | Load: %s | Remove: %s'):format(tostring(entry.activeVariant or 'nenhuma'), table.concat(entry.load or {}, ', '), table.concat(entry.remove or {}, ', ')))
  for index, note in ipairs(entry.notes or {}) do
    if index > 5 then break end
    print(('Nota: %s'):format(tostring(note)))
  end
end

local function teleportToCatalog(key, side)
  local entry = (Config.IPLCatalog or {})[key]
  if type(entry) ~= 'table' then warn('entrada de catálogo inexistente: ' .. tostring(key)); return end
  local destination = entry[side]
  local x, y, z, heading = type(destination) == 'table' and coordinateValues(destination.coords) or nil
  if not x then warn(('coordenada %s indisponível em %s'):format(tostring(side), key)); return end

  local ped = PlayerPedId()
  RequestCollisionAtCoord(x, y, z)
  FreezeEntityPosition(ped, true)
  SetEntityCoordsNoOffset(ped, x, y, z, false, false, false)
  SetEntityHeading(ped, heading)

  local timeoutAt = GetGameTimer() + 3000
  while not HasCollisionLoadedAroundEntity(ped) and GetGameTimer() < timeoutAt do
    RequestCollisionAtCoord(x, y, z)
    Wait(50)
  end

  FreezeEntityPosition(ped, false)
  print(('[mz_settings] TP %s -> %s (%s)'):format(key, side, formatCoords(destination)))
end

CreateThread(function()
  local delay = tonumber((Config.IPL or {}).applyDelayMs) or 1000
  Wait(delay)
  applyIPL()
  startCayoRadarThread()
  if Config.Debug == true then runValidation(true) end
end)

RegisterCommand('mzsettings_reloadipl', function()
  applyIPL()
  startCayoRadarThread()
end, false)

if Config.Debug == true then
  RegisterCommand('mzsettings_ipllist', function(_, args)
    local category = args[1]
    local count = 0
    for key, entry in pairs(Config.IPLCatalog or {}) do
      if not category or tostring(entry.category or ''):find(category, 1, true) then
        count = count + 1
        if count <= 60 then print(('[mz_settings] %s | %s | %s'):format(key, tostring(entry.category), tostring(entry.type))) end
      end
    end
    print(('[mz_settings] %d entrada(s) encontrada(s)%s'):format(count, count > 60 and '; saída limitada a 60' or ''))
  end, false)

  RegisterCommand('mzsettings_iplinfo', function(_, args)
    local key = args[1]
    local entry = key and (Config.IPLCatalog or {})[key] or nil
    if not entry then warn('uso: /mzsettings_iplinfo <key>'); return end
    printCatalogInfo(key, entry)
  end, false)

  RegisterCommand('mzsettings_ipltp', function(_, args)
    local key, side = args[1], args[2]
    if not key or (side ~= 'inside' and side ~= 'outside') then warn('uso: /mzsettings_ipltp <key> inside|outside'); return end
    teleportToCatalog(key, side)
  end, false)

  RegisterCommand('mzsettings_iplvalidate', function()
    runValidation(true)
  end, false)
end
