local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.7.0'
  Config.RegisterIPLCatalog(key, entry)
end

local residences = {
  { 'low_end_apartment', 'Low-end Apartment', 149761, 261.4586, -998.8196, -99.00863, nil },
  { 'medium_end_apartment', 'Medium-end Apartment', 148225, 347.2686, -999.2955, -99.19622, nil },
  { 'high_end_apartment_1', '4 Integrity Way Apt 30', 141313, -35.31277, -580.4199, 88.71221, nil },
  { 'high_end_apartment_2', 'Del Perro Heights Apt 7', 145665, -1477.14, -538.7499, 55.5264, nil },
  { 'high_life_apartment_1', 'Del Perro Heights Apt 4', 145921, -1468.14, -541.815, 73.4442, nil },
  { 'high_life_apartment_2', 'Richard Majestic Apt 2', 146177, -915.811, -379.432, 113.6748, nil },
  { 'high_life_apartment_3', 'Tinsel Towers Apt 42', 146689, -614.86, 40.6783, 97.60007, nil },
  { 'high_life_apartment_4', 'Eclipse Towers Apt 3', 146945, -773.407, 341.766, 211.397, nil },
  { 'high_life_apartment_5', '4 Integrity Way Apt 28', 147201, -18.07856, -583.6725, 79.46569, nil },
  { 'high_life_apartment_6', 'High Life Apartment 6', 147457, -609.5669, 51.28212, -183.9808, nil },
  { 'executive_apartment_1', 'Eclipse Penthouse Suite 1', nil, -787.7805, 334.9232, 215.8384, nil },
  { 'executive_apartment_2', 'Eclipse Penthouse Suite 2', nil, -773.2258, 322.8252, 194.8862, nil },
  { 'executive_apartment_3', 'Eclipse Penthouse Suite 3', nil, -787.7805, 334.9232, 186.1134, nil }
}

for _, data in ipairs(residences) do
  add(data[1], {
    label = data[2], category = 'residences.apartment', type = 'teleport',
    gameBuild = data[7], interiorId = data[3],
    inside = { coords = vector4(data[4], data[5], data[6], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true
  })
end

local houses = {
  { 'high_end_house_1', '3655 Wild Oats Drive', 207105, -169.286, 486.4938, 137.4436 },
  { 'high_end_house_2', '2044 North Conker Avenue', 206081, 340.9412, 437.1798, 149.3925 },
  { 'high_end_house_3', '2045 North Conker Avenue', 206337, 373.023, 416.105, 145.7006 },
  { 'high_end_house_4', '2862 Hillcrest Avenue', 208129, -676.127, 588.612, 145.1698 },
  { 'high_end_house_5', '2868 Hillcrest Avenue', 207617, -763.107, 615.906, 144.1401 },
  { 'high_end_house_6', '2874 Hillcrest Avenue', 207361, -857.798, 682.563, 152.6529 },
  { 'high_end_house_7', '2677 Whispymound Drive', 206593, 120.5, 549.952, 184.097 },
  { 'high_end_house_8', '2133 Mad Wayne Thunder', 208385, -1288.0, 440.748, 97.69459 }
}

for _, data in ipairs(houses) do
  add(data[1], {
    label = data[2], category = 'residences.house', type = 'teleport',
    interiorId = data[3],
    inside = { coords = vector4(data[4], data[5], data[6], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true
  })
end

add('customizable_apartment', {
  label = 'Customizable Apartment', category = 'residences.apartment', type = 'teleport',
  inside = nil, needsRoutingBucket = true,
  notes = { 'TODO: confirmar coordenada e interior ID da variante desejada.' }
})

add('residential_garages', {
  label = 'Residential Garages', category = 'residences.garage', type = 'teleport',
  inside = nil, needsRoutingBucket = true,
  notes = { '2/6/10-car garages possuem interiores distintos.', 'TODO: cadastrar cada coordenada confirmada separadamente.' }
})
