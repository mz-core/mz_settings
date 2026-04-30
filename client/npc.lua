local function disableDispatchServices()
  for i = 1, 15 do
    EnableDispatchService(i, false)
  end
end

local function applyNPCSettings()
  local cfg = Config.NPC or {}
  if cfg.enabled ~= true then return end

  local playerId = PlayerId()

  if cfg.disableCops == true then
    SetCreateRandomCops(false)
    SetCreateRandomCopsNotOnScenarios(false)
    SetCreateRandomCopsOnScenarios(false)
  end

  if cfg.disableDispatch == true or cfg.disableEmergencyServices == true then
    disableDispatchServices()
    SetDispatchCopsForPlayer(playerId, false)
  end

  if cfg.disableWantedLevel == true then
    SetMaxWantedLevel(0)
    ClearPlayerWantedLevel(playerId)
    SetPlayerWantedLevel(playerId, 0, false)
    SetPlayerWantedLevelNow(playerId, false)
  end

  DisablePlayerVehicleRewards(playerId)

  if cfg.clearCopsAroundPlayer == true then
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    ClearAreaOfCops(coords.x, coords.y, coords.z, tonumber(cfg.clearCopsRadius) or 250.0, 0)
  end
end

CreateThread(function()
  while true do
    applyNPCSettings()
    Wait((Config.NPC and tonumber(Config.NPC.loopMs)) or 2500)
  end
end)
