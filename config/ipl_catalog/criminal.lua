local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.7.0'
  Config.RegisterIPLCatalog(key, entry)
end

local biker = {
  { 'biker_clubhouse_1', 'Biker Clubhouse 1', 'bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo', 246273, 1107.04, -3157.399, -37.51859 },
  { 'biker_clubhouse_2', 'Biker Clubhouse 2', 'bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo', 246529, 998.4809, -3164.711, -38.90733 },
  { 'meth_lab', 'Meth Lab', 'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo', 247041, 1009.5, -3196.6, -38.99682 },
  { 'weed_farm', 'Weed Farm', 'bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo', 247297, 1051.491, -3196.536, -39.14842 },
  { 'cocaine_lockup', 'Cocaine Lockup', 'bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo', 247553, 1093.6, -3196.6, -38.99841 },
  { 'counterfeit_cash', 'Counterfeit Cash', 'bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo', 247809, 1121.897, -3195.338, -40.4025 },
  { 'document_forgery', 'Document Forgery', 'bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo', 246785, 1165.0, -3196.6, -39.01306 }
}

for _, data in ipairs(biker) do
  add(data[1], {
    label = data[2], category = 'criminal.biker', type = 'ipl_entitysets',
    load = { data[3] }, interiorId = data[4],
    inside = { coords = vector4(data[5], data[6], data[7], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true,
    notes = { 'Nenhum entity set é ativado automaticamente.' }
  })
end

add('gunrunning_bunker', {
  label = 'Gunrunning Bunker', category = 'criminal.bunker', type = 'ipl_entitysets',
  load = { 'gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_' },
  interiorId = 258561,
  inside = { coords = vector4(892.6384, -3245.8664, -98.2645, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true,
  notes = { 'As onze entradas externas são map toggles independentes no grupo legado.' }
})

add('smuggler_hangar', {
  label = 'Smuggler Hangar', category = 'criminal.hangar', type = 'ipl_entitysets',
  load = { 'sm_smugdlc_interior_placement_interior_0_smugdlc_int_01_milo_' },
  interiorId = 260353,
  inside = { coords = vector4(-1267.0, -3013.135, -49.5, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('freakshop', {
  label = 'Freakshop', category = 'criminal.drug_wars', type = 'ipl_entitysets',
  gameBuild = 2802, load = { 'xm3_warehouse', 'xm3_warehouse_grnd' },
  interiorId = 290817,
  inside = { coords = vector4(570.9713, -420.0727, -70.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('drug_wars_garage', {
  label = 'Drug Wars Garage', category = 'criminal.drug_wars', type = 'ipl_entitysets',
  gameBuild = 2802, load = { 'xm3_garage_fix' }, interiorId = 290561,
  inside = { coords = vector4(519.2477, -2618.788, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('drug_wars_lab', {
  label = 'Drug Wars Acid Lab', category = 'criminal.drug_wars', type = 'teleport',
  gameBuild = 2802, interiorId = 290305,
  inside = { coords = vector4(483.4252, -2625.071, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('tuner_meth_lab', {
  label = 'Tuner Meth Lab', category = 'criminal.tuner', type = 'teleport',
  gameBuild = 2372, interiorId = 284673,
  inside = { coords = vector4(981.9999, -143.0, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('mercenaries_club', {
  label = 'Mercenaries Club', category = 'criminal.mercenaries', type = 'teleport',
  gameBuild = 2944, interiorId = 291841,
  inside = { coords = vector4(1202.407, -3251.251, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('mercenaries_lab', {
  label = 'Mercenaries Lab', category = 'criminal.mercenaries', type = 'teleport',
  gameBuild = 2944, interiorId = 292097,
  inside = { coords = vector4(-1916.119, 3749.719, -100.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('madrazo_ranch', {
  label = 'Madrazo Ranch', category = 'criminal.world', type = 'world',
  inside = nil, notes = { 'Local físico; TODO: confirmar ponto de teste antes de usar.' }
})

add('kosatka_submarine', {
  label = 'Kosatka / Submarine', category = 'criminal.cayo', type = 'teleport',
  gameBuild = 2189, interiorId = 281345,
  inside = { coords = vector4(1560.0, 400.0, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true,
  notes = { 'A lista Cayo ativa já contém o placement do submarino; evite carga duplicada.' }
})

add('lost_mc', {
  label = 'Lost MC Compound', category = 'criminal.biker', type = 'world',
  inside = nil, notes = { 'Local físico; correções de colisão podem vir de outros resources.', 'TODO: confirmar ponto de teste.' }
})
