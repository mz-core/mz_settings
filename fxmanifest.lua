fx_version 'cerulean'
game 'gta5'

name 'mz_settings'
description 'Configurações globais da cidade: IPL, NPCs, sons, tráfego, densidade e mundo.'
author 'Mazus'
version '2.1.3'

lua54 'yes'

client_scripts {
  -- Configuração é client-only: nenhum bloco Config.* é consumido no server.
  'config/shared.lua',
  'config/ipl.lua',
  'config/ipl_cayo.lua',
  'config/ipl_builds.lua',

  'config/ipl_catalog/base.lua',
  'config/ipl_catalog/story.lua',
  'config/ipl_catalog/services.lua',
  'config/ipl_catalog/businesses.lua',
  'config/ipl_catalog/criminal.lua',
  'config/ipl_catalog/entertainment.lua',
  'config/ipl_catalog/residences.lua',
  'config/ipl_catalog/recent_dlc.lua',
  'config/ipl_catalog/settings.lua',

  'config/npc.lua',
  'config/sound.lua',
  'config/traffic.lua',
  'config/peds.lua',
  'config/world.lua',
  'config/blocked_vehicles.lua',
  'config/pickups.lua',
  'config/plates.lua',

  'client/main.lua',
  'client/ipl.lua',
  'client/npc.lua',
  'client/sound.lua',
  'client/placa.lua',
  'client/traffic.lua',
  'client/density.lua',
  'client/world.lua'
}

server_scripts {
  'server/main.lua'
}

files {
  'assets/*.png'
}
