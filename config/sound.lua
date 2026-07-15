Config.Sound = Config.Sound or {
  enabled = true,
  disableVehicleRadio = true,
  disableAmbientMusic = true,
  disablePoliceScanner = true,
  disableFrontendRadio = true,
  disableStaticEmitters = true,
  disableAmbientZones = true,
  defaultRadioStation = 'OFF',
  loopMs = 1500,

  audioScenes = {
    'DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE',
    'FBI_HEIST_H5_MUTE_AMBIENCE_SCENE',
    'CHARACTER_CHANGE_IN_SKY_SCENE'
  },

  audioFlags = {
    DisableFlightMusic = true,
    WantedMusicDisabled = true,
    OnlyAllowScriptTriggerPoliceScanner = true
  },

  staticEmitters = {
    'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
    'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
    'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
  },

  ambientZones = {
    -- { name = 'NOME_CONFIRMADO', enabled = false, persistent = true }
  },

  ambientZoneLists = {
    { name = 'AZL_DLC_Hei4_Island_Disabled_Zones', enabled = false, persistent = true },
    { name = 'AZL_DLC_Hei4_Island_Zones', enabled = true, persistent = true }
  }
}
