local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.6.1'
  Config.RegisterIPLCatalog(key, entry)
end

add('tuner_garage', {
  label = 'Los Santos Tuners Garage', category = 'dlc.tuners', type = 'ipl_entitysets',
  gameBuild = 2372,
  load = { 'tr_tuner_shop_burton', 'tr_tuner_shop_mesa', 'tr_tuner_shop_mission', 'tr_tuner_shop_rancho', 'tr_tuner_shop_strawberry' },
  interiorId = 285953,
  inside = { coords = vector4(-1350.0, 160.0, -100.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('chop_shop_cargo_ship', {
  label = 'Chop Shop Cargo Ship', category = 'dlc.chop_shop', type = 'ipl',
  gameBuild = 3095, load = { 'm23_2_cargoship', 'm23_2_cargoship_bridge' },
  inside = { coords = vector4(-344.4349, -4062.832, 17.0, 0.0), comment = 'Navio / heading pendente de ajuste' }
})

add('chop_shop_cartel_garage', {
  label = 'Chop Shop Cartel Garage', category = 'dlc.chop_shop', type = 'teleport',
  gameBuild = 3095, interiorId = 293633,
  inside = { coords = vector4(1220.133, -2277.844, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('chop_shop_salvage_yard', {
  label = 'Chop Shop Salvage Yard', category = 'dlc.chop_shop', type = 'ipl_entitysets',
  gameBuild = 3095,
  load = { 'm23_2_sp1_03_reds', 'm23_2_sc1_03_reds', 'm23_2_id2_04_reds', 'm23_2_cs1_05_reds', 'm23_2_cs4_11_reds' },
  interiorId = 293377,
  inside = { coords = vector4(1077.276, -2274.876, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('bottom_dollar_carrier', {
  label = 'Bottom Dollar Carrier', category = 'dlc.bounties', type = 'ipl',
  gameBuild = 3258,
  inside = { coords = vector4(-3208.03, 3954.54, 14.0, 0.0), comment = 'Área / heading pendente de ajuste' },
  load = { 'm24_1_carrier' }
})

add('agents_airstrip', {
  label = 'Agents Airstrip', category = 'dlc.agents', type = 'map_toggle',
  gameBuild = 3407,
  inside = { coords = vector4(-2106.98, 1468.31, 282.0, 0.0), comment = 'Área / heading pendente de ajuste' },
  load = { 'm24_2_airstrip' }
})

add('money_fronts_carwash', {
  label = 'Money Fronts Car Wash', category = 'dlc.money_fronts', type = 'teleport',
  gameBuild = 3570,
  inside = { coords = vector4(26.074, -1398.979, -75.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

local mansions = {
  { 'safehouse_mansion_1', 'The Vinewood Residence', 304385, 543.852, 712.754, 201.0 },
  { 'safehouse_mansion_2', 'Richman Villa', 302593, -1630.434, 470.852, 128.0 },
  { 'safehouse_mansion_3', 'Tongva Estate', 303617, -2601.712, 1874.826, 166.0 }
}

for _, data in ipairs(mansions) do
  add(data[1], {
    label = data[2], category = 'dlc.safehouse_hills', type = 'ipl_entitysets',
    gameBuild = 3717, interiorId = data[3],
    inside = { coords = vector4(data[4], data[5], data[6], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true,
    notes = { 'IPLs exteriores variam por mansão e não foram agrupados para evitar estados incompatíveis.' }
  })
end

add('safehouse_mansion_basements', {
  label = 'Safehouse Mansion Basements', category = 'dlc.safehouse_hills', type = 'teleport',
  gameBuild = 3717, inside = nil, needsRoutingBucket = true,
  notes = { 'Há três basements distintos.', 'TODO: confirmar coordenadas internas individualmente antes de usar.' }
})
