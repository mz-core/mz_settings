local function removeConfiguredPickups()
  local cfg = Config.World or {}
  if cfg.removePickups ~= true then return end

  for _, pickup in ipairs(Config.Pickups or {}) do
    local pickupHash = type(pickup) == 'string' and GetHashKey(pickup) or pickup
    if pickupHash then
      RemoveAllPickupsOfType(pickupHash)
    end
  end
end

local function disablePedWeaponDropsNearPlayer()
  local cfg = Config.World or {}
  if cfg.disableWeaponDrops ~= true then return end

  local ped = PlayerPedId()
  local coords = GetEntityCoords(ped)
  local handle, foundPed = FindFirstPed()
  local success = true

  repeat
    if foundPed and foundPed ~= 0 and foundPed ~= ped and DoesEntityExist(foundPed) then
      local foundCoords = GetEntityCoords(foundPed)
      if #(coords - foundCoords) <= 120.0 then
        SetPedDropsWeaponsWhenDead(foundPed, false)
      end
    end
    success, foundPed = FindNextPed(handle)
  until not success

  EndFindPed(handle)
end

local function applyScenarioTypes()
  local cfg = Config.World or {}

  for scenarioType, enabled in pairs(cfg.scenarioTypes or {}) do
    SetScenarioTypeEnabled(tostring(scenarioType), enabled == true)
  end
end

local function applyWorldSettings()
  local cfg = Config.World or {}
  if cfg.enabled ~= true then return end

  local playerId = PlayerId()
  local ped = PlayerPedId()

  if cfg.disableHealthRecharge == true then
    SetPlayerHealthRechargeMultiplier(playerId, 0.0)
  end

  if cfg.disableAutoHelmet == true then
    SetPedConfigFlag(ped, 35, false)
  end

  if cfg.disablePlayerWanted == true then
    SetMaxWantedLevel(tonumber(cfg.maxWantedLevel) or 0)
    ClearPlayerWantedLevel(playerId)
    SetPlayerWantedLevel(playerId, 0, false)
    SetPlayerWantedLevelNow(playerId, false)
  end

  if cfg.disableCover == true then
    SetPlayerCanUseCover(playerId, false)
  end

  if cfg.disableRandomEvents == true then
    SetRandomEventFlag(false)
  end

  if cfg.deepOceanScaler ~= nil then
    SetDeepOceanScaler((tonumber(cfg.deepOceanScaler) or 0.0) + 0.0)
  end

  applyScenarioTypes()
  removeConfiguredPickups()
  disablePedWeaponDropsNearPlayer()
end

local function requestEntityControl(entity, timeoutMs)
  if not entity or entity == 0 or not DoesEntityExist(entity) then
    return false
  end

  local timeoutAt = GetGameTimer() + (tonumber(timeoutMs) or 1500)

  repeat
    if NetworkHasControlOfEntity(entity) then
      return true
    end

    NetworkRequestControlOfEntity(entity)
    Wait(0)
  until GetGameTimer() > timeoutAt

  return NetworkHasControlOfEntity(entity)
end

local function notifyBlockedVehicle(modelName)
  if GetResourceState('mz_notify') == 'started' then
    exports['mz_notify']:Notify({
      title = 'Mundo',
      message = ('Veiculo bloqueado removido: %s'):format(tostring(modelName or 'unknown')),
      type = 'warning',
      duration = 3500
    })
    return
  end

  if Config.Debug == true then
    print(('[mz_settings] Veiculo bloqueado removido: %s'):format(tostring(modelName or 'unknown')))
  end
end

local function deleteVehicleSafely(vehicle)
  if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
    return false
  end

  local ped = PlayerPedId()
  if IsPedInVehicle(ped, vehicle, false) then
    TaskLeaveVehicle(ped, vehicle, 16)

    local timeoutAt = GetGameTimer() + 2000
    while IsPedInVehicle(ped, vehicle, false) and GetGameTimer() <= timeoutAt do
      Wait(50)
    end
  end

  if DoesEntityExist(vehicle) then
    SetVehicleEngineOn(vehicle, false, true, true)
    SetEntityAsMissionEntity(vehicle, true, true)
    requestEntityControl(vehicle, 2000)
    DeleteVehicle(vehicle)
  end

  if DoesEntityExist(vehicle) then
    DeleteEntity(vehicle)
  end

  if DoesEntityExist(vehicle) then
    local timeoutAt = GetGameTimer() + 2000
    while DoesEntityExist(vehicle) and GetGameTimer() <= timeoutAt do
      requestEntityControl(vehicle, 250)
      SetEntityAsMissionEntity(vehicle, true, true)
      DeleteVehicle(vehicle)
      if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
      end
      Wait(50)
    end
  end

  return DoesEntityExist(vehicle) ~= true
end

local function buildBlockedVehicleLookup()
  local lookup = {}
  local cfg = Config.BlockedVehiclesCleanup or {}

  for modelName in pairs(cfg.models or {}) do
    local normalized = tostring(modelName or ''):lower()
    if normalized ~= '' then
      lookup[GetHashKey(normalized)] = normalized
    end
  end

  return lookup
end

local blockedVehicleHashes = buildBlockedVehicleLookup()
local lastBlockedVehicleNotifyAt = 0

local function cleanupBlockedVehicles()
  local cfg = Config.BlockedVehiclesCleanup or {}
  if cfg.enabled ~= true then
    return
  end

  local ped = PlayerPedId()

  for _, vehicle in ipairs(GetGamePool('CVehicle')) do
    if vehicle and vehicle ~= 0 and DoesEntityExist(vehicle) then
      local modelName = blockedVehicleHashes[GetEntityModel(vehicle)]
      if modelName then
        if cfg.notifyDriver == true and IsPedInVehicle(ped, vehicle, false) then
          local now = GetGameTimer()
          local cooldown = tonumber(cfg.notifyCooldownMs or 8000) or 8000
          if now - lastBlockedVehicleNotifyAt >= cooldown then
            lastBlockedVehicleNotifyAt = now
            notifyBlockedVehicle(modelName)
          end
        end

        deleteVehicleSafely(vehicle)
      end
    end
  end
end

CreateThread(function()
  while true do
    applyWorldSettings()
    Wait((Config.World and tonumber(Config.World.loopMs)) or 1500)
  end
end)

CreateThread(function()
  while true do
    cleanupBlockedVehicles()
    Wait((Config.BlockedVehiclesCleanup and tonumber(Config.BlockedVehiclesCleanup.intervalMs)) or 2000)
  end
end)
