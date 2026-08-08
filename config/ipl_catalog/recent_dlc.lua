local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.7.0'
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
  label = 'Money Fronts Car Wash', category = 'dlc.money_fronts', type = 'ipl_entitysets',
  gameBuild = 3570, dlcName = 'mp2025_01',
  load = { 'm25_1_carwash' }, interiorId = 298497,
  entitySets = { { name = 'set_carwash_tints', enabled = true } },
  inside = { coords = vector4(26.074, -1398.979, -75.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

local mansions = {
  {
    'safehouse_mansion_1', 'The Vinewood Residence', 304385, 543.852, 712.754, 201.0,
    {
      'm25_2_ch2_04_mansion_interior_a', 'm25_2_ch2_04_mansion_interior_b',
      'm25_2_ch2_04_mansion_interior_c', 'apa_ch2_04_mansion_shared',
      'apa_ch2_04_mansion_private', 'apa_ch2_04_mansion_furniture',
      'apa_ch2_04_mansion_firepit', 'apa_ch2_04_mansion_railings_p',
      'm25_2_east_mansion_gym', 'm25_2_east_dog_house', 'm25_2_mansion_props',
      'hei_ch1_roads_mansion', 'apa_ch2_04_mansion_shared_distantlights',
      'apa_ch2_04_mansion_shared_lodlights'
    }
  },
  {
    'safehouse_mansion_2', 'Richman Villa', 302593, -1630.434, 470.852, 128.0,
    {
      'hei_ch1_06e_mansion_shared', 'hei_ch1_06f_mansion_shared',
      'm25_2_ch1_06e_mansion_interior_a', 'm25_2_ch1_06e_mansion_interior_b',
      'm25_2_ch1_06e_mansion_interior_c', 'hei_ch1_06e_mansion_private',
      'hei_ch1_06e_mansion_furniture', 'hei_ch1_06e_mansion_firepit',
      'hei_ch1_06e_mansion_railings_p', 'm25_2_mansion_gym', 'm25_2_dog_house',
      'm25_2_mansion_props', 'hei_ch1_roads_mansion',
      'hei_ch1_06e_mansion_shared_distantlights', 'hei_ch1_06e_mansion_shared_lodlights'
    }
  },
  {
    'safehouse_mansion_3', 'Tongva Estate', 303617, -2601.712, 1874.826, 166.0,
    {
      'hei_ch1_09_mansion_shared', 'm25_2_ch1_09_mansion_interior_a',
      'm25_2_ch1_09_mansion_interior_b', 'm25_2_ch1_09_mansion_interior_c',
      'hei_ch1_09_mansion_private', 'hei_ch1_09_mansion_furniture',
      'hei_ch1_09_mansion_firepit', 'hei_ch1_09_mansion_railings_p',
      'm25_2_tongva_mansion_gym', 'm25_2_tongva_dog_house', 'm25_2_mansion_props',
      'hei_ch1_roads_mansion', 'hei_ch1_09_mansion_shared_distantlights',
      'hei_ch1_09_mansion_shared_lodlights'
    }
  }
}

for _, data in ipairs(mansions) do
  add(data[1], {
    label = data[2], category = 'dlc.safehouse_hills', type = 'ipl_entitysets',
    gameBuild = 3717, dlcName = 'mp2025_02', interiorId = data[3], load = data[7],
    inside = { coords = vector4(data[4], data[5], data[6], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true,
    entitySets = {
      { name = 'set_style_cali', enabled = true },
      { name = 'set_elev_cali', enabled = true },
      { name = 'set_art_coastal', enabled = true },
      { name = 'set_wallpaper_deco', enabled = true },
      { name = 'set_style_cali_tint', enabled = true, color = 0 },
      { name = 'set_ai_tablets_03', enabled = true },
      { name = 'set_pet_cat', enabled = true },
      { name = 'set_pet_dog', enabled = true }
    }
  })
end

add('safehouse_mansion_basements', {
  label = 'Safehouse Mansion Basements', category = 'dlc.safehouse_hills', type = 'teleport',
  gameBuild = 3717, dlcName = 'mp2025_02', inside = nil, needsRoutingBucket = true,
  notes = { 'Há três basements distintos.', 'TODO: confirmar coordenadas internas individualmente antes de usar.' }
})

local mansionBasements = {
  { 'safehouse_mansion_basement_1', 'Vinewood Residence Basement', 304641 },
  { 'safehouse_mansion_basement_2', 'Richman Villa Basement', 303105 },
  { 'safehouse_mansion_basement_3', 'Tongva Estate Basement', 303873 }
}

for _, data in ipairs(mansionBasements) do
  add(data[1], {
    label = data[2], category = 'dlc.safehouse_hills', type = 'ipl_entitysets',
    gameBuild = 3717, dlcName = 'mp2025_02', interiorId = data[3],
    entitySets = {
      { name = 'set_vault_door_open', enabled = true },
      { name = 'set_base_ai_tablets_03', enabled = true },
      { name = 'set_elev_std', enabled = true },
      { name = 'set_base_vault_00', enabled = true },
      { name = 'set_base_vault_01', enabled = true },
      { name = 'set_base_vault_02', enabled = true },
      { name = 'set_base_vault_03', enabled = true },
      { name = 'set_base_vault_04', enabled = true }
    },
    needsRoutingBucket = true
  })
end

add('kortz_museum', {
  label = 'Kortz Center Museum', category = 'dlc.kortz', type = 'map_toggle',
  gameBuild = 3889, dlcName = 'mp2026_01',
  load = { 'm26_1_mp2026_01_additions_exterior', 'm26_1_mp2026_01_additions_exterior_cctv' },
  activeVariant = 'gates_up', overlapGroup = 'kortz_museum_gates',
  variants = {
    gates_up = {
      load = { 'm26_1_mp2026_01_additions_kortz_lowerbarriers_up' },
      remove = { 'm26_1_mp2026_01_additions_kortz_lowerbarriers' }
    },
    gates_down = {
      load = { 'm26_1_mp2026_01_additions_kortz_lowerbarriers' },
      remove = { 'm26_1_mp2026_01_additions_kortz_lowerbarriers_up' }
    }
  },
  outside = { coords = vector4(-2242.157, 270.780, 173.5, 0.0), comment = 'Kortz Center' }
})

local kortzInteriors = {
  {
    'kortz_exhibition', 'Kortz Exhibition', 305921, 2603.167, 5903.761, -50.0,
    { 'set_background_art', 'set_exhibit_walls', 'set_exhibit_robbable',
      'set_exhibit_dressing', 'set_alarm_panel', 'set_camera_button',
      'set_cameras_02', 'set_keypads_exhibit', 'set_glass_pane', 'set_tvs' }
  },
  {
    'kortz_basement', 'Kortz Exhibition Basement', 306177, 2631.411, 5893.864, -62.0,
    { 'set_lock_box', 'set_station_2', 'set_code_computer', 'set_keypads_basement',
      'set_cameras_03', 'set_lazer_switches', 'collision_8p4piob' }
  },
  {
    'kortz_loading_bay', 'Kortz Loading Bay', 305409, 2693.671, 5877.493, -62.0,
    { 'set_mule_cargo', 'set_keypads_loading_bay', 'set_cameras_04' }
  },
  {
    'kortz_sewers', 'Kortz Sewers', 305665, 2662.276, 5928.208, -67.0, {}
  },
  {
    'kortz_workshop', 'Kortz Art Studio', 306433, 2583.915, 5961.410, -50.0,
    { 'set_vault_door', 'set_hacking_usb', 'set_vault_hacking_angel',
      'set_chair_easel', 'set_hazmat', 'set_drills' }
  }
}

for _, data in ipairs(kortzInteriors) do
  local sets = {}
  for _, name in ipairs(data[7]) do sets[#sets + 1] = { name = name, enabled = true } end

  add(data[1], {
    label = data[2], category = 'dlc.kortz', type = 'ipl_entitysets',
    gameBuild = 3889, dlcName = 'mp2026_01', interiorId = data[3], entitySets = sets,
    inside = { coords = vector4(data[4], data[5], data[6], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true
  })
end
