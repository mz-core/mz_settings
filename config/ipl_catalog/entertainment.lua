local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.6.1'
  Config.RegisterIPLCatalog(key, entry)
end

add('after_hours_nightclub', {
  label = 'After Hours Nightclub', category = 'entertainment.nightclub', type = 'ipl_entitysets',
  load = { 'ba_int_placement_ba_interior_0_dlc_int_01_ba_milo_' },
  interiorId = 271617,
  inside = { coords = vector4(-1604.664, -3012.583, -78.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true,
  activeVariant = nil, overlapGroup = 'after_hours_interior_style',
  variants = {
    traditional = { entitySets = { { name = 'Int01_ba_Style01', enabled = true }, { name = 'Int01_ba_dj01', enabled = true } } },
    edgy = { entitySets = { { name = 'Int01_ba_Style02', enabled = true }, { name = 'Int01_ba_dj02', enabled = true } } },
    glam = { entitySets = { { name = 'Int01_ba_Style03', enabled = true }, { name = 'Int01_ba_dj03', enabled = true } } }
  },
  notes = { 'Escolha exatamente um estilo/DJ; warehouse e garage não são carregados por esta entrada.' }
})

add('nightclub_warehouse', {
  label = 'Nightclub Warehouse / Garage', category = 'entertainment.nightclub', type = 'teleport',
  interiorId = 271617,
  inside = { coords = vector4(-1604.664, -3012.583, -78.0, 0.0), comment = 'Interior compartilhado / heading pendente de ajuste' },
  needsRoutingBucket = true,
  notes = { 'Compartilha o interior principal; configure entity sets conforme o uso.' }
})

add('music_locker', {
  label = 'The Music Locker', category = 'entertainment.nightclub', type = 'ipl_entitysets',
  gameBuild = 2189, interiorId = 281089,
  inside = { coords = vector4(1550.0, 250.0, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true,
  activeVariant = nil, overlapGroup = 'music_locker_poster',
  variants = {
    palmstraxx = { load = { 'h4_clubposter_palmstraxx' } },
    moodymann = { load = { 'h4_clubposter_moodymann' } },
    keinemusik = { load = { 'h4_clubposter_keinemusik' } }
  }
})

add('diamond_casino', {
  label = 'Diamond Casino', category = 'entertainment.casino', type = 'ipl',
  gameBuild = 2060,
  load = { 'hei_dlc_windows_casino', 'hei_dlc_casino_aircon', 'vw_dlc_casino_door', 'hei_dlc_casino_door', 'vw_casino_main' },
  inside = { coords = vector4(1110.20, 216.60, -49.45, 0.0), comment = 'Interior normal / heading pendente de ajuste' },
  overlapGroup = 'diamond_casino_main_state',
  notes = { 'Não combinar a versão normal com a versão heist sem teste.' }
})

add('casino_penthouse', {
  label = 'Casino Penthouse', category = 'entertainment.casino', type = 'ipl_entitysets',
  gameBuild = 2060, load = { 'vw_casino_penthouse' }, interiorId = 274689,
  inside = { coords = vector4(976.636, 70.295, 115.164, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('casino_garage', {
  label = 'Casino Loading Bay Garage', category = 'entertainment.casino', type = 'ipl',
  gameBuild = 2060, load = { 'vw_casino_garage' },
  inside = { coords = vector4(2536.276, -278.98, -64.722, 0.0), comment = 'Loading bay / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('casino_carpark', {
  label = 'Casino Car Park', category = 'entertainment.casino', type = 'ipl',
  gameBuild = 2060, load = { 'vw_casino_carpark' },
  inside = { coords = vector4(1380.0, 200.0, -50.0, 0.0), comment = 'Car park / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('diamond_arcade', {
  label = 'Diamond Arcade', category = 'entertainment.arcade', type = 'teleport',
  gameBuild = 2060, interiorId = 278273,
  inside = { coords = vector4(2732.0, -380.0, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('diamond_arcade_basement', {
  label = 'Arcade Basement', category = 'entertainment.arcade', type = 'teleport',
  gameBuild = 2060, interiorId = 278529,
  inside = { coords = vector4(2710.0, -360.780, -56.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('arcade_garage', {
  label = 'Arcade Garage', category = 'entertainment.arcade', type = 'ipl_entitysets',
  gameBuild = 2060, interiorId = 278529,
  inside = { coords = vector4(2710.0, -360.780, -56.0, 0.0), comment = 'Basement / heading pendente de ajuste' },
  entitySets = { { name = 'set_plan_garage', enabled = true }, { name = 'set_plan_wall', enabled = true } },
  needsRoutingBucket = true,
  notes = { 'Entity sets só serão aplicados quando a entrada for explicitamente habilitada.' }
})

add('ls_car_meet', {
  label = 'LS Car Meet', category = 'entertainment.vehicles', type = 'ipl_entitysets',
  gameBuild = 2372, load = { 'tr_tuner_meetup', 'tr_tuner_race_line' }, interiorId = 285697,
  inside = { coords = vector4(-2000.0, 1113.211, -25.36243, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('recording_studio', {
  label = 'Recording Studio', category = 'entertainment.studio', type = 'teleport',
  gameBuild = 2545, interiorId = 286977,
  inside = { coords = vector4(-1010.22, -52.21, -100.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true,
  notes = { 'O IPL da referência 2.6.1 contém espaço final suspeito e não foi copiado.' }
})

add('movie_theatre', {
  label = 'Movie Theatre', category = 'entertainment.world', type = 'world',
  inside = nil, notes = { 'Local físico; TODO: confirmar ponto de teste antes de usar.' }
})

add('dignity_yacht', {
  label = 'Dignity Yacht', category = 'entertainment.yacht', type = 'ipl',
  load = { 'hei_yacht_heist', 'hei_yacht_heist_Bar', 'hei_yacht_heist_Bedrm', 'hei_yacht_heist_Bridge', 'hei_yacht_heist_DistantLights', 'hei_yacht_heist_enginrm', 'hei_yacht_heist_LODLights', 'hei_yacht_heist_Lounge' },
  inside = { coords = vector4(-2043.974, -1031.582, 11.981, 0.0), comment = 'Iate / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.dignity_yacht'
})

add('party_yacht', {
  label = 'Gunrunning Party Yacht', category = 'entertainment.yacht', type = 'ipl',
  load = { 'gr_grdlc_yacht_placement', 'gr_heist_yacht2' },
  inside = { coords = vector4(-1363.724, 6734.108, 2.44598, 0.0), comment = 'Iate / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.gunrunning_yacht'
})
