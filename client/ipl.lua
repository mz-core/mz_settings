local cayoRadarRunning = false

local function debug(msg)
  if MZSettings and MZSettings.Debug then
    MZSettings.Debug(msg)
  end
end

local function isEnabled(entry)
  return type(entry) == 'table' and entry.enabled == true
end

local function applyRemoveList(list, sourceName)
  for _, ipl in ipairs(list or {}) do
    if type(ipl) == 'string' and ipl ~= '' then
      RemoveIpl(ipl)
      debug(('IPL removido [%s]: %s'):format(sourceName or 'manual', ipl))
    end
  end
end

local function applyLoadList(list, sourceName)
  for _, ipl in ipairs(list or {}) do
    if type(ipl) == 'string' and ipl ~= '' then
      RequestIpl(ipl)
      debug(('IPL carregado [%s]: %s'):format(sourceName or 'manual', ipl))
    end
  end
end

local function resolveInteriorId(entry)
  if not entry or type(entry) ~= 'table' then return nil end

  if type(entry.interior) == 'number' then
    return entry.interior
  end

  if type(entry.coords) == 'table' then
    local x = tonumber(entry.coords.x)
    local y = tonumber(entry.coords.y)
    local z = tonumber(entry.coords.z)

    if x and y and z then
      return GetInteriorAtCoords(x, y, z)
    end
  end

  return nil
end

local function applyInteriorProps(interiors)
  for name, entry in pairs(interiors or {}) do
    if isEnabled(entry) then
      local interiorId = resolveInteriorId(entry)

      if interiorId and interiorId ~= 0 and IsValidInterior(interiorId) then
        for _, prop in ipairs(entry.props or {}) do
          if type(prop) == 'string' and prop ~= '' then
            EnableInteriorProp(interiorId, prop)

            if entry.colors and entry.colors[prop] ~= nil then
              SetInteriorPropColor(interiorId, prop, entry.colors[prop])
            end
          end
        end

        RefreshInterior(interiorId)
        debug(('Interior props aplicados [%s]: %s'):format(name, tostring(interiorId)))
      else
        debug(('Interior inválido ou não carregado [%s]'):format(name))
      end
    end
  end
end

local function applyIPL()
  local cfg = Config.IPL or {}
  if cfg.enabled ~= true then return end

  if cfg.loadMpDlcMaps == true then
    LoadMpDlcMaps()
  end

  if cfg.enableMpDlcMaps == true then
    EnableMpDlcMaps(true)
  end

  applyRemoveList(cfg.remove, 'manual')
  applyLoadList(cfg.load, 'manual')

  for groupName, group in pairs(cfg.groups or {}) do
    if isEnabled(group) then
      applyRemoveList(group.remove, groupName)
      applyLoadList(group.load, groupName)
    end
  end

  applyInteriorProps(cfg.interiors)
end

local function shouldRunCayoRadar()
  local cfg = Config.IPL or {}
  local radar = cfg.cayoRadar or {}
  local groups = cfg.groups or {}
  local cayo = groups.cayo_perico or {}

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
        SetRadarAsInteriorThisFrame(
          interiorHash,
          tonumber(radar.x) or 4700.0,
          tonumber(radar.y) or -5145.0,
          tonumber(radar.heading) or 0,
          0
        )
        Wait(0)
      else
        Wait(1000)
      end
    end
  end)
end

CreateThread(function()
  local delay = tonumber((Config.IPL or {}).applyDelayMs) or 1000
  Wait(delay)
  applyIPL()
  startCayoRadarThread()
end)

RegisterCommand('mzsettings_reloadipl', function()
  applyIPL()
  startCayoRadarThread()
end, false)
