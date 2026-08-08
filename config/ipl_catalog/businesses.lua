local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.7.0'
  Config.RegisterIPLCatalog(key, entry)
end

local offices = {
  { 'arcadius_office', 'Arcadius Business Centre', 'ex_dt1_02_office_01c', -141.1987, -620.913, 168.8205 },
  { 'maze_bank_office', 'Maze Bank Building', 'ex_dt1_11_office_01b', -75.8466, -826.9893, 243.3859 },
  { 'lom_bank_office', 'Lom Bank', 'ex_sm_13_office_01a', -1579.756, -565.0661, 108.523 },
  { 'maze_bank_west_office', 'Maze Bank West', 'ex_sm_15_office_02b', -1392.667, -480.4736, 72.04217 }
}

for _, data in ipairs(offices) do
  add(data[1], {
    label = data[2], category = 'business.office', type = 'ipl_entitysets',
    load = { data[3] },
    inside = { coords = vector4(data[4], data[5], data[6], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true,
    notes = { 'O estilo indicado no IPL é o legado atual; estilos alternativos exigem teste individual.' }
  })
end

local garages = {
  { 'arcadius_garage_1', 'Arcadius Garage 1', 'imp_dt1_02_cargarage_a', 253441, -191.0133, -579.1428, 135.0 },
  { 'arcadius_garage_2', 'Arcadius Garage 2', 'imp_dt1_02_cargarage_b', 253697, -117.4989, -568.1132, 135.0 },
  { 'arcadius_garage_3', 'Arcadius Garage 3', 'imp_dt1_02_cargarage_c', 253953, -136.0780, -630.1852, 135.0 },
  { 'arcadius_mod_shop', 'Arcadius Mod Shop', 'imp_dt1_02_modgarage', 254209, -146.6166, -596.6301, 166.0 },
  { 'maze_bank_garage_1', 'Maze Bank Garage 1', 'imp_dt1_11_cargarage_a', 254465, -84.2193, -823.0851, 221.0 },
  { 'maze_bank_garage_2', 'Maze Bank Garage 2', 'imp_dt1_11_cargarage_b', 254721, -69.8627, -824.7498, 221.0 },
  { 'maze_bank_garage_3', 'Maze Bank Garage 3', 'imp_dt1_11_cargarage_c', 254977, -80.4318, -813.2536, 221.0 },
  { 'maze_bank_mod_shop', 'Maze Bank Mod Shop', 'imp_dt1_11_modgarage', 255233, -73.9039, -821.6204, 284.0 },
  { 'lom_bank_garage_1', 'Lom Bank Garage 1', 'imp_sm_13_cargarage_a', 255489, -1581.1120, -567.2450, 85.5 },
  { 'lom_bank_garage_2', 'Lom Bank Garage 2', 'imp_sm_13_cargarage_b', 255745, -1568.7390, -562.0455, 85.5 },
  { 'lom_bank_garage_3', 'Lom Bank Garage 3', 'imp_sm_13_cargarage_c', 256001, -1563.5570, -574.4314, 85.5 },
  { 'lom_bank_mod_shop', 'Lom Bank Mod Shop', 'imp_sm_13_modgarage', 256257, -1578.0230, -576.4251, 104.2 },
  { 'maze_bank_west_garage_1', 'Maze Bank West Garage 1', 'imp_sm_15_cargarage_a', 256513, -1388.8400, -478.7402, 56.1 },
  { 'maze_bank_west_garage_2', 'Maze Bank West Garage 2', 'imp_sm_15_cargarage_b', 256769, -1388.8600, -478.7574, 48.1 },
  { 'maze_bank_west_garage_3', 'Maze Bank West Garage 3', 'imp_sm_15_cargarage_c', 257025, -1374.6820, -474.3586, 56.1 },
  { 'maze_bank_west_mod_shop', 'Maze Bank West Mod Shop', 'imp_sm_15_modgarage', 257281, -1391.2450, -473.9638, 77.2 }
}

for _, data in ipairs(garages) do
  add(data[1], {
    label = data[2], category = 'business.garage', type = 'ipl_entitysets',
    load = { data[3] }, interiorId = data[4],
    inside = { coords = vector4(data[5], data[6], data[7], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true,
    overlapGroup = data[1]:match('^(.-)_garage_') and (data[1]:match('^(.-)_garage_') .. '_garage_floor') or nil,
    notes = { 'Os andares do mesmo prédio podem se sobrepor; habilite e teste individualmente.' }
  })
end

add('vehicle_warehouse', {
  label = 'Import/Export Vehicle Warehouse', category = 'business.vehicles', type = 'ipl_entitysets',
  load = { 'imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_' },
  interiorId = 252673,
  inside = { coords = vector4(994.5925, -3002.594, -39.64699, 0.0), comment = 'Andar superior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('criminal_enterprise_vehicle_warehouse', {
  label = 'Criminal Enterprise Vehicle Warehouse', category = 'business.vehicles', type = 'ipl_entitysets',
  gameBuild = 2699, load = { 'reh_int_placement_sum2_interior_0_dlc_int_03_sum2_milo_' },
  interiorId = 289537,
  inside = { coords = vector4(800.13696, -3001.4297, -65.14074, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('criminal_enterprise_warehouse', {
  label = 'Criminal Enterprise Warehouse', category = 'business.warehouse', type = 'ipl_entitysets',
  gameBuild = 2699, load = { 'reh_int_placement_sum2_interior_1_dlc_int_04_sum2_milo_' },
  interiorId = 289793,
  inside = { coords = vector4(849.1047, -3000.209, -45.974354, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('money_fronts_office', {
  label = 'Money Fronts Office', category = 'business.office', type = 'ipl_entitysets',
  gameBuild = 3570, dlcName = 'mp2025_01', load = { 'm25_1_helitours', 'm25_1_smokeonthewater' },
  interiorId = 298753,
  inside = { coords = vector4(-1160.493, -1538.932, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  activeVariant = nil, overlapGroup = 'money_fronts_office_style',
  variants = { heli = { entitySets = { { name = 'set_heli', enabled = true } } }, smoke = { entitySets = { { name = 'set_smoke', enabled = true } } } },
  needsRoutingBucket = true
})

add('mission_carpark', {
  label = 'Mission Carpark', category = 'business.garage', type = 'teleport',
  inside = nil, needsRoutingBucket = true,
  notes = { 'TODO: confirmar coordenada e interior ID antes de usar.' }
})

for _, size in ipairs({ 2, 6, 10 }) do
  add(('garage_%d_car'):format(size), {
    label = ('%d-car Garage'):format(size), category = 'business.garage', type = 'teleport',
    inside = nil, needsRoutingBucket = true,
    notes = { 'TODO: confirmar coordenada e interior ID da variante antes de usar.' }
  })
end

add('solomon_office', {
  label = 'Solomon Office', category = 'business.office', type = 'teleport',
  inside = nil, notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})
