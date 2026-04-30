CreateThread(function()
  while true do
    local cfg = Config.Peds or {}

    if cfg.enabled == true then
      SetPedPopulationBudget(math.floor(MZSettings.ClampNumber(cfg.pedPopulationBudget, 0, 3, 2)))
      SetVehiclePopulationBudget(math.floor(MZSettings.ClampNumber(cfg.vehiclePopulationBudget, 0, 3, 2)))
      SetPedDensityMultiplierThisFrame(MZSettings.ClampNumber(cfg.pedDensity, 0.0, 1.0, 0.2))
      SetScenarioPedDensityMultiplierThisFrame(
        MZSettings.ClampNumber(cfg.scenarioPedDensity, 0.0, 1.0, 0.1),
        MZSettings.ClampNumber(cfg.scenarioPedDensity, 0.0, 1.0, 0.1)
      )
    end

    Wait(0)
  end
end)
