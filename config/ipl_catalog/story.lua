local function add(key, entry)
  entry.enabled = false
  entry.source = entry.source or 'Bob74 IPL 2.6.1'
  Config.RegisterIPLCatalog(key, entry)
end

add('michael_house', {
  label = 'Michael House', category = 'story.residence', type = 'ipl_entitysets',
  load = { 'V_Michael', 'V_Michael_Garage' }, interiorId = 166657,
  inside = { coords = vector4(-802.311, 175.056, 72.8446, 0.0), comment = 'Interior / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.story_interiors'
})

add('franklin_house', {
  label = 'Franklin House', category = 'story.residence', type = 'teleport',
  interiorId = 206849, inside = nil,
  notes = { 'Interior ID confirmado.', 'TODO: confirmar coordenada interna antes de usar.' }
})

add('franklin_aunt', {
  label = 'Franklin Aunt House', category = 'story.residence', type = 'teleport',
  interiorId = 197889,
  inside = { coords = vector4(-9.96562, -1438.54, 31.1015, 0.0), comment = 'Interior / heading pendente de ajuste' }
})

add('floyd_apartment', {
  label = 'Floyd Apartment', category = 'story.residence', type = 'teleport',
  interiorId = 171777,
  inside = { coords = vector4(-1150.703, -1520.713, 10.633, 0.0), comment = 'Interior / heading pendente de ajuste' }
})

add('trevor_trailer', {
  label = 'Trevor Trailer', category = 'story.residence', type = 'map_toggle',
  interiorId = 2562,
  inside = { coords = vector4(1985.48132, 3828.76757, 32.5, 0.0), comment = 'Interior / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.story_interiors', overlapGroup = 'trevor_trailer_state',
  activeVariant = nil,
  variants = {
    tidy = { label = 'Organizado', load = { 'TrevorsTrailerTidy' }, remove = { 'TrevorsTrailerTrash' } },
    trash = { label = 'Sujo', load = { 'TrevorsTrailerTrash' }, remove = { 'TrevorsTrailerTidy' } }
  },
  notes = { 'TrevorsTrailer é base/complementar; Tidy e Trash são estados mutuamente exclusivos.', 'O grupo legado também contém TrevorsMP e aguarda teste runtime.' }
})

add('simeon_showroom', {
  label = 'Simeon Showroom', category = 'business.vehicles', type = 'ipl_entitysets',
  load = { 'shr_int' }, interiorId = 7170,
  inside = { coords = vector4(-47.16170, -1115.3327, 26.5, 0.0), comment = 'Showroom / heading pendente de ajuste' },
  managedBy = 'Config.IPL.groups.story_interiors', overlapGroup = 'simeon_showroom_state',
  activeVariant = nil,
  variants = {
    normal = { load = {}, remove = { 'csr_inMission' }, entitySets = { { name = 'csr_beforeMission', enabled = true } } },
    destroyed = { load = {}, entitySets = { { name = 'csr_afterMissionA', enabled = true } } }
  },
  notes = { 'Pode conflitar com PDM/MLO customizado; desative explicitamente o IPL nativo quando necessário.' },
  conflictsWith = { 'custom_pdm_mlo' }
})

add('lifeinvader', {
  label = 'Lifeinvader Office', category = 'business.office', type = 'ipl',
  load = { 'facelobby' }, remove = { 'facelobbyfake' },
  managedBy = 'Config.IPL.groups.story_interiors', inside = nil,
  notes = { 'TODO: confirmar coordenada interna antes de usar.' }
})

add('lester_factory', {
  label = 'Lester Factory', category = 'business.office', type = 'teleport',
  interiorId = 92674, inside = nil,
  notes = { 'Interior ID confirmado.', 'TODO: confirmar coordenada interna antes de usar.' }
})

add('oneil_farm', {
  label = 'O’Neil Farm', category = 'criminal.story', type = 'map_toggle',
  load = { 'des_farmhs_startimap', 'des_farmhs_start_occl', 'farm', 'farmint', 'farm_lod', 'farm_props' },
  remove = { 'farmint_cap', 'farmint_cap_lod' }, inside = nil,
  notes = { 'Grupo operacional farm permanece desativado.', 'TODO: confirmar coordenada interna antes de usar.' }
})

add('heist_apartment_state', {
  label = 'Heist Apartment State', category = 'story.map', type = 'map_toggle',
  managedBy = 'Config.IPL.groups.map_fixes_story', overlapGroup = 'bnkheist_apartment_state',
  activeVariant = nil,
  variants = {
    normal = { load = { 'bnkheist_apt_norm' }, remove = { 'bnkheist_apt_dest' } },
    destroyed = { load = { 'bnkheist_apt_dest' }, remove = { 'bnkheist_apt_norm' } }
  },
  notes = { 'Os dois estados continuam ativos no legado para preservar o visual atual.', 'Aguardando teste runtime antes de escolher uma variante.' }
})

add('jewelry_store_state', {
  label = 'Vangelico Jewelry Store', category = 'story.map', type = 'map_toggle',
  overlapGroup = 'jewelry_store_state', activeVariant = nil,
  variants = {
    normal = { load = { 'post_hiest_unload' }, remove = { 'jewel2fake' } },
    heist = { load = { 'jewel2' }, remove = { 'post_hiest_unload' } }
  },
  notes = { 'Escolha uma variante após teste runtime.' }
})

add('train_bridge_state', {
  label = 'Train Bridge State', category = 'story.map', type = 'map_toggle',
  overlapGroup = 'train_bridge_state', activeVariant = nil,
  variants = {
    intact = { load = { 'cs5_4_trains' } },
    track = { load = { 'ld_rail_01_track', 'ld_rail_02_track' } }
  },
  notes = { 'Estados documentados; compatibilidade visual aguarda runtime.' }
})

add('stilt_house_state', {
  label = 'Stilt House State', category = 'story.map', type = 'map_toggle',
  load = { 'des_stilthouse_rebuild' }, inside = nil,
  notes = { 'Reconstrução carregada no grupo legado.', 'TODO: confirmar coordenada de teste.' }
})
