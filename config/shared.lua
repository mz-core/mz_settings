Config = Config or {}

-- Ative apenas durante desenvolvimento: libera logs, validação e comandos de TP.
Config.Debug = false

Config.IPLCatalog = Config.IPLCatalog or {}
Config.IPLCatalogDuplicates = Config.IPLCatalogDuplicates or {}

-- O registro central permite ao validador detectar uma chave declarada duas vezes.
function Config.RegisterIPLCatalog(key, entry)
  if type(key) ~= 'string' or key == '' or type(entry) ~= 'table' then
    return false
  end

  if Config.IPLCatalog[key] ~= nil then
    Config.IPLCatalogDuplicates[key] = (Config.IPLCatalogDuplicates[key] or 1) + 1
  end

  if entry.enabled == nil then
    entry.enabled = false
  end

  Config.IPLCatalog[key] = entry
  return true
end
