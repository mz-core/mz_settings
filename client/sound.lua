local function debugAudio(message)
  if MZSettings and MZSettings.Debug then
    MZSettings.Debug(('audio: %s'):format(tostring(message)))
  end
end

local function callNative(nativeName, ...)
  local native = _G[nativeName]
  if type(native) ~= 'function' then
    debugAudio(('native indisponivel: %s'):format(nativeName))
    return false
  end

  local ok, err = pcall(native, ...)
  if not ok then
    debugAudio(('%s falhou: %s'):format(nativeName, tostring(err)))
    return false
  end

  return true
end

local function getAudioEntryName(entry)
  if type(entry) == 'string' then
    return entry
  end

  if type(entry) == 'table' then
    return tostring(entry.name or entry[1] or '')
  end

  return ''
end

local function getAudioEntryEnabled(entry, defaultEnabled)
  if type(entry) == 'table' and entry.enabled ~= nil then
    return entry.enabled == true
  end

  return defaultEnabled == true
end

local function getAudioEntryPersistent(entry)
  if type(entry) == 'table' and entry.persistent ~= nil then
    return entry.persistent == true
  end

  return true
end

local function applyGlobalAudioFlags()
  local cfg = Config.Sound or {}
  if cfg.enabled ~= true then return end

  for _, scene in ipairs(cfg.audioScenes or {}) do
    if type(scene) == 'string' and scene ~= '' then
      StartAudioScene(scene)
    end
  end

  if cfg.disablePoliceScanner == true then
    SetAudioFlag('PoliceScannerDisabled', true)
  end

  if cfg.disableAmbientMusic == true then
    for flag, enabled in pairs(cfg.audioFlags or {}) do
      if enabled == true then
        SetAudioFlag(tostring(flag), true)
      end
    end
  end

  if cfg.disableFrontendRadio == true then
    SetUserRadioControlEnabled(false)
    SetRadioToStationName(cfg.defaultRadioStation or 'OFF')
    callNative('SetFrontendRadioActive', false)
    callNative('SetMobileRadioEnabledDuringGameplay', false)
  end
end

local function applyAmbientAudioControls()
  local cfg = Config.Sound or {}
  if cfg.enabled ~= true then return end

  if cfg.disableStaticEmitters == true then
    for _, entry in ipairs(cfg.staticEmitters or {}) do
      local name = getAudioEntryName(entry)
      if name ~= '' then
        callNative('SetStaticEmitterEnabled', name, getAudioEntryEnabled(entry, false))
      end
    end
  end

  if cfg.disableAmbientZones == true then
    for _, entry in ipairs(cfg.ambientZones or {}) do
      local name = getAudioEntryName(entry)
      if name ~= '' then
        callNative(
          'SetAmbientZoneStatePersistent',
          name,
          getAudioEntryEnabled(entry, false),
          getAudioEntryPersistent(entry)
        )
      end
    end

    for _, entry in ipairs(cfg.ambientZoneLists or {}) do
      local name = getAudioEntryName(entry)
      if name ~= '' then
        callNative(
          'SetAmbientZoneListStatePersistent',
          name,
          getAudioEntryEnabled(entry, false),
          getAudioEntryPersistent(entry)
        )
      end
    end
  end
end

local function applyVehicleRadioOff()
  local cfg = Config.Sound or {}
  if cfg.enabled ~= true or cfg.disableVehicleRadio ~= true then return end

  local ped = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(ped, false)
  if vehicle == 0 then return end

  SetVehRadioStation(vehicle, cfg.defaultRadioStation or 'OFF')
  SetVehicleRadioEnabled(vehicle, false)
  callNative('SetVehicleRadioLoud', vehicle, false)
end

CreateThread(function()
  Wait(500)
  applyGlobalAudioFlags()
  applyAmbientAudioControls()

  while true do
    applyGlobalAudioFlags()
    applyAmbientAudioControls()
    applyVehicleRadioOff()
    Wait((Config.Sound and tonumber(Config.Sound.loopMs)) or 1500)
  end
end)
