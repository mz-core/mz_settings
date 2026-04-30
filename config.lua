Config = Config or {}

-- true mostra prints de debug no client/server. Use apenas para testar config.
Config.Debug = false

-- IPLs/interiores/mapas base.
-- enabled = true aplica a lista ao iniciar o resource.
-- load carrega IPLs/interiores.
-- remove descarrega IPLs/interiores indesejados.
Config.IPL = {
  enabled = true,
  load = {
    -- Exemplos:
    -- 'vw_casino_main',
    -- 'hei_dlc_windows_casino',

    'apa_v_mp_h_01_a',
    'canyonriver01',
    'facelobby'
  },
  remove = {
    -- Exemplos:
    -- 'fakeint',
  }
}

-- NPCs, cops, wanted e dispatch.
-- enabled = false desliga todo este bloco.
-- disableCops remove cops aleatorios criados pelo GTA.
-- disableDispatch desliga chamados/servicos de emergencia nativos.
-- disableWantedLevel impede nivel de procurado.
-- disableScenarioCops reduz cops parados/em cenarios.
-- disableEmergencyServices desliga ambulancia/bombeiro/policia do dispatch.
-- disableRandomBoats/disableRandomTrains controla spawns nativos.
-- clearCopsAroundPlayer limpa cops perto do jogador a cada loop.
-- Cuidado: true pode causar NPCs/cops sumindo quando o player se aproxima.
-- loopMs define o intervalo de reaplicacao.
Config.NPC = {
  enabled = true,
  disableCops = true,
  disableDispatch = true,
  disableWantedLevel = true,
  disableScenarioCops = true,
  disableEmergencyServices = true,
  disableRandomBoats = true,
  disableRandomTrains = false,
  clearCopsAroundPlayer = false,
  clearCopsRadius = 80.0,
  loopMs = 2500
}

-- Sons, radios, musicas nativas e ambientes.
-- enabled = false desliga todo o controle de audio deste resource.
-- disableVehicleRadio desliga radio nativa dentro dos veiculos.
-- disableAmbientMusic aplica flags para reduzir musicas nativas do GTA.
-- disablePoliceScanner desliga scanner de policia.
-- disableFrontendRadio desliga controle/radio da interface nativa.
-- disableStaticEmitters aplica staticEmitters abaixo.
-- disableAmbientZones aplica ambientZones/ambientZoneLists abaixo.
-- defaultRadioStation normalmente deve ficar 'OFF'.
-- loopMs define de quanto em quanto tempo o audio e reaplicado.
Config.Sound = {
  enabled = true,
  disableVehicleRadio = true,
  disableAmbientMusic = true,
  disablePoliceScanner = true,
  disableFrontendRadio = true,
  disableStaticEmitters = true,
  disableAmbientZones = true,
  defaultRadioStation = 'OFF',
  loopMs = 1500,

  -- Cenas de audio nativas. Algumas ajudam a mutar transicoes, radios
  -- internas ou ambiencias especiais. Se alguma afetar demais o mapa,
  -- comente individualmente.
  audioScenes = {
    'DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE',
    'FBI_HEIST_H5_MUTE_AMBIENCE_SCENE',
    'CHARACTER_CHANGE_IN_SKY_SCENE'
  },

  -- Flags globais aplicadas quando disableAmbientMusic = true.
  -- true ativa a flag. false/ausente nao aplica.
  audioFlags = {
    DisableFlightMusic = true,
    WantedMusicDisabled = true,
    OnlyAllowScriptTriggerPoliceScanner = true
  },

  -- Static emitters sao sons fixos do mapa/interiores: musicas de bares,
  -- boates, TVs, radios e ambientes de DLC.
  -- String simples desliga o emitter.
  -- Tabela permite escolher: { name = 'NOME', enabled = false }.
  --
  -- Onde procurar nomes:
  -- 1. CodeWalker: abra .ymap/.ytyp e procure audio emitters do local.
  -- 2. OpenIV: pesquise vanilla, bahama, tequilala, casino, nightclub, bar.
  -- 3. Client/config/README do MLO.
  -- 4. Native usada: SetStaticEmitterEnabled.
  staticEmitters = {
    'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
    'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
    'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM',
  },

  -- Ambient zones sao zonas/listas de som ambiente. Nem todo bar usa isso;
  -- muitos usam static emitter. Use quando souber o nome exato da zona.
  -- enabled = false desliga a zona/lista.
  -- enabled = true liga a zona/lista.
  -- persistent = true mantem o estado persistente.
  ambientZones = {
    -- { name = 'NOME_DA_ZONA', enabled = false, persistent = true }
  },

  ambientZoneLists = {
    -- Cayo Perico/Heist Island. Nao e "bar"; controla ambiencia da ilha.
    -- Comente se nao usa a ilha/interiores dela.
    { name = 'AZL_DLC_Hei4_Island_Disabled_Zones', enabled = false, persistent = true },
    { name = 'AZL_DLC_Hei4_Island_Zones', enabled = true, persistent = true },

    -- { name = 'NOME_DA_LISTA', enabled = false, persistent = true }
  }
}

-- Densidade de veiculos. Estes multiplicadores precisam rodar por frame.
-- 0.0 remove quase tudo; 1.0 e densidade normal do GTA.
-- vehicleDensity controla trafego geral.
-- randomVehicleDensity controla veiculos aleatorios.
-- parkedVehicleDensity controla veiculos estacionados.
-- emergency/boat/train ficam documentados para uso futuro; nem todos sao
-- aplicados por native neste resource ainda.
-- disableVehicleDistantLights remove luzes distantes artificiais de veiculos.
-- parkedVehicles controla o numero absoluto de veiculos estacionados.
-- garbageTrucks/randomBoats/randomTrains controlam spawns nativos especificos.
-- distantCopCarSirens controla sirenes distantes sem viatura visivel.
Config.Traffic = {
  enabled = true,
  vehicleDensity = 0.20,
  randomVehicleDensity = 0.10,
  parkedVehicleDensity = 0.10,
  emergencyVehicleDensity = 0.0,
  boatDensity = 0.0,
  trainDensity = 0.0,
  parkedVehicles = 0,
  garbageTrucks = false,
  randomBoats = false,
  randomTrains = false,
  disableVehicleDistantLights = true,
  distantCopCarSirens = false
}

-- Densidade de pedestres. Estes multiplicadores precisam rodar por frame.
-- pedDensity controla pedestres comuns.
-- scenarioPedDensity controla pedestres de cenarios/parados.
-- pedPopulationBudget/vehiclePopulationBudget controlam o orcamento global
-- de entidades do GTA. 0 deixa a cidade muito vazia; valores baixos evitam
-- excesso sem causar sumico brusco.
Config.Peds = {
  enabled = true,
  pedDensity = 0.20,
  scenarioPedDensity = 0.10,
  pedPopulationBudget = 2,
  vehiclePopulationBudget = 2
}

-- Regras gerais do mundo.
-- disableWeaponDrops impede NPCs de derrubarem armas.
-- disableHealthRecharge impede regeneracao de vida nativa.
-- disableAutoHelmet impede capacete automatico em motos.
-- disablePlayerWanted reforca wanted level em zero.
-- disableCover impede o jogador de grudar em cobertura nativa.
-- disableRandomEvents remove eventos aleatorios nativos.
-- deepOceanScaler = 0.0 remove o mar profundo exagerado; ajuste com cuidado.
-- removePickups remove pickups listados em Config.Pickups.
Config.World = {
  enabled = true,
  disableWeaponDrops = true,
  disableHealthRecharge = true,
  disableAutoHelmet = true,
  disablePlayerWanted = true,
  disableCover = true,
  disableRandomEvents = true,
  deepOceanScaler = 0.0,
  maxWantedLevel = 0,
  removePickups = true,
  loopMs = 1500,

  -- Scenario types controlam cenarios nativos do mundo.
  -- false desativa o tipo; true ativa/permite.
  scenarioTypes = {
    -- Lista principal: reduz veiculos/cenarios indesejados sem apagar peds
    -- manualmente perto do jogador.
    WORLD_VEHICLE_ATTRACTOR = false,
    WORLD_VEHICLE_AMBULANCE = false,
    WORLD_VEHICLE_BIKE_OFF_ROAD_RACE = false,
    WORLD_VEHICLE_BROKEN_DOWN = false,
    WORLD_VEHICLE_FIRE_TRUCK = false,
    WORLD_VEHICLE_HELI_LIFEGUARD = false,
    WORLD_VEHICLE_POLICE = false,
    WORLD_VEHICLE_STREETRACE = false,
    WORLD_VEHICLE_SALTON_DIRT_BIKE = false,
    WORLD_VEHICLE_SALTON = false,
    WORLD_VEHICLE_POLICE_NEXT_TO_CAR = false,
    WORLD_VEHICLE_POLICE_CAR = false,
    WORLD_VEHICLE_POLICE_BIKE = false,
    WORLD_VEHICLE_MILITARY_PLANES_SMALL = false,
    WORLD_VEHICLE_MILITARY_PLANES_BIG = false,
    WORLD_VEHICLE_MECHANIC = false,
    WORLD_VEHICLE_EMPTY = false,
    WORLD_VEHICLE_BUSINESSMEN = false,
    WORLD_VEHICLE_BIKE_OFF_ROAD_RACE = false
  }
}

-- Limpeza de veiculos bloqueados no mundo.
-- Responsabilidade do mz_settings porque e controle global de entidades.
-- Use para impedir que modelos proibidos existam mesmo se forem spawnados por
-- hack, trainer, comando admin indevido ou brecha de outro script.
-- Mantenha esta lista alinhada com bloqueios de gameplay, se usar garagem.
Config.BlockedVehiclesCleanup = {
  enabled = true,
  intervalMs = 2000,
  notifyDriver = true,
  notifyCooldownMs = 8000,
  models = {
    hydra = { reason = 'military_aircraft' },
    rhino = { reason = 'military_vehicle' },
    lazer = { reason = 'military_aircraft' },
    apc = { reason = 'military_vehicle' }
  }
}

-- Pickups comuns que geralmente aparecem em NPCs/armas.
-- So sao removidos se Config.World.removePickups = true.
Config.Pickups = {
  'PICKUP_WEAPON_PISTOL',
  'PICKUP_WEAPON_COMBATPISTOL',
  'PICKUP_WEAPON_APPISTOL',
  'PICKUP_WEAPON_MICROSMG',
  'PICKUP_WEAPON_SMG',
  'PICKUP_WEAPON_ASSAULTRIFLE',
  'PICKUP_WEAPON_CARBINERIFLE',
  'PICKUP_WEAPON_PUMPSHOTGUN',
  'PICKUP_WEAPON_SAWNOFFSHOTGUN',
  'PICKUP_WEAPON_SNIPERRIFLE',
  'PICKUP_WEAPON_MG',
  'PICKUP_WEAPON_GRENADE',
  'PICKUP_WEAPON_MOLOTOV',
  'PICKUP_WEAPON_STICKYBOMB',
  'PICKUP_WEAPON_KNIFE',
  'PICKUP_WEAPON_BAT',
  'PICKUP_WEAPON_CROWBAR',
  'PICKUP_AMMO_BULLET_MP',
  'PICKUP_AMMO_MISSILE_MP',
  'PICKUP_AMMO_GRENADELAUNCHER_MP',
  'PICKUP_HEALTH_STANDARD',
  'PICKUP_ARMOUR_STANDARD'
}

-- Preset opcional: cidade limpa/sem NPCs.
-- Este bloco esta comentado de proposito. Para usar, copie os valores para os
-- blocos Config.Traffic e Config.Peds acima.
--
-- O que faz:
-- - reduz pedestres comuns e pedestres de cenario para 0;
-- - reduz trafego, carros aleatorios e estacionados para 0;
-- - zera budgets de populacao;
-- - evita caminho agressivo de deletar NPC perto do player.
--
-- Importante:
-- - Nao use ClearAreaOfPeds/ClearAreaOfVehicles em loop como primeira opcao.
--   Isso causa o efeito feio de NPC/veiculo sumindo na frente do jogador.
-- - Se algum NPC residual continuar aparecendo, crie depois uma limpeza suave
--   apenas para entidades distantes/fora da tela.
--
-- Config.Traffic = {
--   enabled = true,
--   vehicleDensity = 0.0,
--   randomVehicleDensity = 0.0,
--   parkedVehicleDensity = 0.0,
--   emergencyVehicleDensity = 0.0,
--   boatDensity = 0.0,
--   trainDensity = 0.0,
--   parkedVehicles = 0,
--   garbageTrucks = false,
--   randomBoats = false,
--   randomTrains = false,
--   disableVehicleDistantLights = true,
--   distantCopCarSirens = false
-- }
--
-- Config.Peds = {
--   enabled = true,
--   pedDensity = 0.0,
--   scenarioPedDensity = 0.0,
--   pedPopulationBudget = 0,
--   vehiclePopulationBudget = 0
-- }
