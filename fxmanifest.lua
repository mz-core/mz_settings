fx_version 'cerulean'
game 'gta5'

name 'mz_settings'
description 'Configurações globais da cidade: IPL, NPCs, sons, tráfego, densidade e mundo.'
author 'Mazus'
version '1.0.0'

lua54 'yes'

shared_scripts {
  'config.lua'
}

client_scripts {
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
