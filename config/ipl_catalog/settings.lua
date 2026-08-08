-- ============================================================
-- CONFIGURAÇÃO AMIGÁVEL DE IPLS
-- Edite somente este arquivo para ligar/desligar IPLs da cidade.
-- ============================================================

Config.IPLSettings = {
  enabled = true,

  -- "auto" detecta a build real de cada client (recomendado).
  compatibility = {
    mode = 'auto',
    manualBuild = nil,
    skipUnsupported = true,
    checkDlcPresence = true,
    loadBuildFixes = true
  },

  -- Grupos prontos. true liga; false desliga.
  groups = {
    legacy_cleanup = true,
    map_fixes_story = { enabled = true, variant = 'heist_normal' },
    story_interiors = { enabled = true, variant = 'trevor_trash' },
    cayo_perico = { enabled = true, variant = 'secured' },

    ships = false,
    dignity_yacht = false,
    gunrunning_yacht = false,
    gunrunning_bunkers = false,
    online_apartments_offices = false,
    online_business = false,
    nightclub_cases = false,
    farm = false,
    misc = false
  },

  -- Props de interiores legados.
  interiors = {
    bunker_farmhouse = false,
    vehicle_warehouse = false,
    counterfeit_cash = false,
    cayo_submarine = false
  },

  cayoRadar = true,

  -- Necessário nas mansões das builds 3717/3751 para evitar o mapa genérico
  -- sobreposto à versão acessível (área branca/LOD quebrado).
  mansionLodFix = true,

  -- Catálogo opcional. Liste somente o que a cidade usa.
  -- Formatos:
  --   nome_da_entrada = true
  --   nome_da_entrada = { enabled = true, variant = 'nome' }
  catalog = {
    -- Los Santos Tuners Garage — BUILD 2372
    tuner_garage = true,

    -- ========================================================
    -- A SAFEHOUSE IN THE HILLS — BUILD 3717/3751 / DLC mp2025_02
    -- ========================================================
    -- Ative a mansão e seu basement correspondente.

    -- The Vinewood Residence: 543.852, 712.754, 201.0
    safehouse_mansion_1 = true,
    safehouse_mansion_basement_1 = true,

    -- Richman Villa: -1630.434, 470.852, 128.0
    safehouse_mansion_2 = true,
    safehouse_mansion_basement_2 = true,

    -- Tongva Estate: -2601.712, 1874.826, 166.0
    safehouse_mansion_3 = true,
    safehouse_mansion_basement_3 = true,

    -- Exemplos:
    -- cargo_ship_base = { enabled = true, variant = 'normal' },
    -- kortz_museum = { enabled = true, variant = 'gates_up' },
  }
}

local settings = Config.IPLSettings or {}
local ipl = Config.IPL or {}
ipl.compatibility = ipl.compatibility or {}
Config.IPL = ipl

if settings.enabled ~= nil then ipl.enabled = settings.enabled == true end

for key, value in pairs(settings.compatibility or {}) do
  ipl.compatibility[key] = value
end

for key, value in pairs(settings.groups or {}) do
  local group = (ipl.groups or {})[key]
  if group then
    if type(value) == 'boolean' then
      group.enabled = value
    elseif type(value) == 'table' then
      group.enabled = value.enabled == true
      if value.variant ~= nil then group.activeVariant = value.variant end
    end
  elseif Config.Debug == true then
    print(('[mz_settings] IPL: grupo não encontrado: %s'):format(tostring(key)))
  end
end

for key, enabled in pairs(settings.interiors or {}) do
  local interior = (ipl.interiors or {})[key]
  if interior then
    interior.enabled = enabled == true
  elseif Config.Debug == true then
    print(('[mz_settings] IPL: interior não encontrado: %s'):format(tostring(key)))
  end
end

if settings.cayoRadar ~= nil and ipl.cayoRadar then
  ipl.cayoRadar.enabled = settings.cayoRadar == true
end

if settings.mansionLodFix ~= nil and ipl.mansionLodFix then
  ipl.mansionLodFix.enabled = settings.mansionLodFix == true
end

-- Compatibilidade com o antigo Config.IPLCatalogSettings flat/entries.
local legacyCatalog = Config.IPLCatalogSettings
local catalog = legacyCatalog and (legacyCatalog.entries or legacyCatalog) or settings.catalog or {}

for key, value in pairs(catalog) do
  local entry = Config.IPLCatalog[key]
  if entry then
    if type(value) == 'boolean' then
      entry.enabled = value
    elseif type(value) == 'table' then
      entry.enabled = value.enabled == true
      if value.variant ~= nil then entry.activeVariant = value.variant end
    end
  elseif Config.Debug == true then
    print(('[mz_settings] Catálogo: chave não encontrada: %s'):format(tostring(key)))
  end
end
