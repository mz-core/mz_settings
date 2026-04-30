CreateThread(function()
  while true do
    local cfg = Config.Traffic or {}

    if cfg.enabled == true then
      SetNumberOfParkedVehicles(tonumber(cfg.parkedVehicles) or 0)
      SetVehicleDensityMultiplierThisFrame(MZSettings.ClampNumber(cfg.vehicleDensity, 0.0, 1.0, 0.2))
      SetRandomVehicleDensityMultiplierThisFrame(MZSettings.ClampNumber(cfg.randomVehicleDensity, 0.0, 1.0, 0.1))
      SetParkedVehicleDensityMultiplierThisFrame(MZSettings.ClampNumber(cfg.parkedVehicleDensity, 0.0, 1.0, 0.1))
      SetGarbageTrucks(cfg.garbageTrucks == true)
      SetRandomBoats(cfg.randomBoats == true)
      SetRandomTrains(cfg.randomTrains == true)
      DisableVehicleDistantlights(cfg.disableVehicleDistantLights == true)
      DistantCopCarSirens(cfg.distantCopCarSirens == true)
    end

    Wait(0)
  end
end)
