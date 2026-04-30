local function applyIPL()
  local cfg = Config.IPL or {}
  if cfg.enabled ~= true then return end

  for _, ipl in ipairs(cfg.remove or {}) do
    if type(ipl) == 'string' and ipl ~= '' then
      RemoveIpl(ipl)
      MZSettings.Debug(('IPL removido: %s'):format(ipl))
    end
  end

  for _, ipl in ipairs(cfg.load or {}) do
    if type(ipl) == 'string' and ipl ~= '' then
      RequestIpl(ipl)
      MZSettings.Debug(('IPL carregado: %s'):format(ipl))
    end
  end
end

CreateThread(function()
  Wait(1000)
  applyIPL()
end)

RegisterCommand('mzsettings_reloadipl', function()
  applyIPL()
end, false)
