local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.7.0'
  Config.RegisterIPLCatalog(key, entry)
end

local securityOffices = {
  { 'security_office_1', 'Security Office 1', 'sf_fixeroffice_bh1_05', 287489, -1021.86084, -427.74564, 68.95764 },
  { 'security_office_2', 'Security Office 2', 'sf_fixeroffice_hw1_08', 288257, 383.4156, -59.878227, 108.4595 },
  { 'security_office_3', 'Security Office 3', 'sf_fixeroffice_kt1_05', 288001, -1004.23035, -761.2084, 66.99069 },
  { 'security_office_4', 'Security Office 4', 'sf_fixeroffice_kt1_08', 287745, -587.87213, -716.84937, 118.10156 }
}

for _, data in ipairs(securityOffices) do
  -- TP interno: coordenada confirmada na referência Bob74 2.7.0.
  add(data[1], {
    label = data[2], category = 'services.security', type = 'ipl_entitysets',
    gameBuild = 2545, load = { data[3] }, interiorId = data[4],
    inside = { coords = vector4(data[5], data[6], data[7], 0.0), comment = 'Interior / heading pendente de ajuste' },
    needsRoutingBucket = true,
    notes = { 'Entity sets disponíveis na referência; nenhum é ativado automaticamente pelo catálogo.' }
  })
end

add('security_garage', {
  label = 'Security Garage', category = 'services.security', type = 'ipl_entitysets',
  gameBuild = 2545, load = { 'sf_int_placement_sec_interior_2_dlc_garage_sec_milo_' },
  interiorId = 286721,
  inside = { coords = vector4(-1071.4387, -77.033875, -93.525505, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('doomsday_facility', {
  label = 'Doomsday Facility', category = 'services.government', type = 'ipl_entitysets',
  load = { 'xm_x17dlc_int_placement_interior_33_x17dlc_int_02_milo_' },
  interiorId = 269313,
  inside = { coords = vector4(345.0, 4842.0, -60.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true,
  notes = { 'Entradas externas variam por hatch; escolha fora deste resource.' }
})

add('iaa_office', {
  label = 'IAA Office', category = 'services.government', type = 'teleport',
  inside = nil, notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})

add('fib_upper_floors', {
  label = 'FIB Upper Floors', category = 'services.police', type = 'teleport',
  inside = nil,
  notes = { 'Separado do FIB Lobby.', 'TODO: confirmar coordenada interna antes de usar.' }
})

add('iaa_facility', {
  label = 'IAA Facility', category = 'services.government', type = 'teleport',
  inside = nil, notes = { 'Use a entrada Doomsday Facility quando o objetivo for o interior x17.', 'TODO: confirmar a coordenada específica da IAA.' }
})

add('server_farm', {
  label = 'Server Farm', category = 'services.government', type = 'teleport',
  inside = nil, notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})

add('psychiatrist_office', {
  label = 'Psychiatrist Office', category = 'services.health', type = 'teleport',
  inside = nil, notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})

add('bottom_dollar_office', {
  label = 'Bottom Dollar Bail Office', category = 'services.bounties', type = 'ipl_entitysets',
  gameBuild = 3258,
  load = { 'm24_1_bailoffice_davis', 'm24_1_bailoffice_delperro', 'm24_1_bailoffice_missionrow', 'm24_1_bailoffice_paletobay', 'm24_1_bailoffice_vinewood' },
  interiorId = 295425,
  inside = { coords = vector4(565.886, -2688.761, -50.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('agents_office', {
  label = 'Agents Office', category = 'services.security', type = 'ipl_entitysets',
  gameBuild = 3407, interiorId = 297985,
  inside = { coords = vector4(2149.71, 4787.76, -47.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})

add('agents_factory', {
  label = 'Agents Garment Factory', category = 'services.security', type = 'ipl_entitysets',
  gameBuild = 3407, load = { 'm24_2_garment_factory' }, interiorId = 297729,
  inside = { coords = vector4(752.31, -997.24, -47.0, 0.0), comment = 'Interior / heading pendente de ajuste' },
  needsRoutingBucket = true
})
