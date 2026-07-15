Config.Traffic = Config.Traffic or {
  enabled = true,
  vehicleDensity = 0.20,
  randomVehicleDensity = 0.10,
  parkedVehicleDensity = 0.10,
  emergencyVehicleDensity = 0.0, -- Reservado: ainda não consumido pelo client.
  boatDensity = 0.0, -- Reservado: ainda não consumido pelo client.
  trainDensity = 0.0, -- Reservado: ainda não consumido pelo client.
  parkedVehicles = 0,
  garbageTrucks = false,
  randomBoats = false,
  randomTrains = false,
  disableVehicleDistantLights = true,
  distantCopCarSirens = false
}

-- Preset opcional de cidade vazia: copie estes valores para Config.Traffic.
-- vehicleDensity/randomVehicleDensity/parkedVehicleDensity = 0.0 e
-- parkedVehicles = 0. Evite limpar veículos próximos em loop.
