local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.6.1'
  Config.RegisterIPLCatalog(key, entry)
end

add('fib_lobby', {
  label = 'FIB Lobby', category = 'services.police', type = 'ipl',
  load = { 'FIBlobby' }, remove = { 'FIBlobbyfake' },
  inside = { coords = vector4(110.400, -744.200, 45.750, 0.0), comment = 'TP interno documentado; heading pendente de ajuste' },
  overlapGroup = 'fib_lobby_state', managedBy = 'Config.IPL.groups.story_interiors',
  notes = { 'O carregamento atual continua sob o grupo legado.', 'Não ativar junto com FIBlobbyfake.' },
  tags = { 'police', 'government', 'story' }
})

add('union_depository', {
  label = 'Union Depository', category = 'story.services', type = 'ipl',
  load = { 'FINBANK' }, managedBy = 'Config.IPL.groups.story_interiors',
  inside = nil,
  notes = { 'TODO: confirmar coordenada interna antes de usar.', 'Espelho informativo do grupo legado.' }
})

add('morgue_coroner', {
  label = 'Morgue / Coroner', category = 'services.health', type = 'ipl',
  load = { 'Coroner_Int_On', 'coronertrash' },
  remove = { 'rc12b_hospitalinterior', 'rc12b_destroyed' },
  managedBy = 'Config.IPL.groups.map_fixes_story', inside = nil,
  notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})

add('pillbox_hospital', {
  label = 'Pillbox Hospital', category = 'services.health', type = 'ipl',
  load = { 'rc12b_default' }, remove = { 'rc12b_hospitalinterior', 'rc12b_destroyed' },
  inside = { coords = vector4(307.1680, -590.8070, 43.2800, 0.0), comment = 'Interior / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.map_fixes_story', overlapGroup = 'pillbox_state'
})

add('bahama_mamas', {
  label = 'Bahama Mamas', category = 'entertainment.nightclub', type = 'ipl',
  load = { 'hei_sm_16_interior_v_bahama_milo_' },
  inside = { coords = vector4(-1388.0013, -618.41967, 30.819599, 0.0), comment = 'Interior / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.map_fixes_story'
})

add('vanilla_unicorn', {
  label = 'Vanilla Unicorn', category = 'entertainment.club', type = 'teleport',
  interiorId = 197121, inside = nil,
  notes = { 'Interior ID confirmado.', 'TODO: confirmar coordenada interna antes de usar.' }
})

add('cargo_ship_base', {
  label = 'Cargo Ship (base)', category = 'story.world', type = 'map_toggle',
  inside = { coords = vector4(-168.1825, -2364.8259, 20.0000, 0.0), comment = 'Navio / heading pendente de ajuste' },
  overlapGroup = 'base_cargo_ship_state', activeVariant = nil,
  variants = {
    normal = { label = 'Normal', load = { 'cargoship', 'ship_occ_grp1' }, remove = { 'sunkcargoship', 'ship_occ_grp2' } },
    sunk = { label = 'Afundado', load = { 'sunkcargoship', 'ship_occ_grp2' }, remove = { 'cargoship', 'ship_occ_grp1' } }
  },
  notes = { "Defina activeVariant = 'normal' ou 'sunk'." }
})

add('north_yankton', {
  label = 'North Yankton', category = 'story.world', type = 'map_toggle',
  inside = { coords = vector4(3217.697, -4834.826, 111.8152, 0.0), comment = 'Área de teste / heading pendente de ajuste' },
  load = {
    'prologue01', 'prologue01c', 'prologue01d', 'prologue01e', 'prologue01f',
    'prologue01g', 'prologue01h', 'prologue01i', 'prologue01j', 'prologue01k',
    'prologue01z', 'prologue02', 'prologue03', 'prologue03b', 'prologue04',
    'prologue04b', 'prologue05', 'prologue05b', 'prologue06', 'prologue06b',
    'prologue_occl', 'prologue06_int', 'prologuerd', 'prologuerdb',
    'prologue_DistantLights', 'prologue_LODLights', 'DES_ProTree_start', 'prologue_m2_door'
  },
  activeVariant = nil, overlapGroup = 'north_yankton_grave',
  variants = {
    covered = { load = { 'prologue03_grv_cov' }, remove = { 'prologue03_grv_dug', 'prologue03_grv_fun' } },
    dug = { load = { 'prologue03_grv_dug' }, remove = { 'prologue03_grv_cov', 'prologue03_grv_fun' } },
    funeral = { load = { 'prologue03_grv_fun' }, remove = { 'prologue03_grv_cov', 'prologue03_grv_dug' } }
  }
})

add('red_carpet', {
  label = 'Red Carpet', category = 'story.world', type = 'map_toggle',
  load = { 'redCarpet' },
  inside = { coords = vector4(300.5927, 199.7589, 104.3776, 0.0), comment = 'Área / heading pendente de ajuste' },
  overlapGroup = 'red_carpet_state'
})

add('aircraft_carrier', {
  label = 'Aircraft Carrier', category = 'story.world', type = 'ipl',
  load = { 'hei_carrier', 'hei_carrier_int1', 'hei_carrier_int2', 'hei_carrier_int3', 'hei_carrier_int4', 'hei_carrier_int5', 'hei_carrier_int6', 'hei_carrier_lodlights' },
  inside = { coords = vector4(3082.3117, -4717.1191, 15.2622, 0.0), comment = 'Convés / heading pendente de ajuste' }
})

add('stadium', {
  label = 'Maze Bank Arena / Stadium', category = 'entertainment.world', type = 'world',
  inside = nil, notes = { 'Local físico do mapa.', 'TODO: confirmar coordenada de teste antes de usar.' }
})
