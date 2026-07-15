-- ============================================================
-- CONFIGURAÇÃO SIMPLES DO CATÁLOGO DE IPLS
-- ============================================================
--
-- Este arquivo reúne todas as entradas disponíveis nos arquivos do catálogo.
--
-- enabled = true   -> ativa a entrada
-- enabled = false  -> desativa a entrada
-- variant = 'nome' -> escolhe uma versão quando houver opções
-- variant = nil    -> nenhuma variante selecionada
--
-- Depois de salvar, execute no console do servidor:
-- restart mz_settings
--
-- IMPORTANTE:
-- 1. Ative uma entrada por vez durante os testes.
-- 2. Não ative variantes incompatíveis da mesma área.
-- 3. Entradas marcadas como "Informativo" usam um grupo legado de config/ipl.lua.
-- 4. world e teleport não chamam RequestIpl; podem exigir configuração externa.
-- 5. As 134 entradas permanecem desativadas por padrão.

Config.IPLCatalogSettings = {
  -- ==========================================================
  -- STORY E MAPA BASE
  -- ==========================================================

  -- Heist Apartment State | story.map | map_toggle
  -- Informativo: controlado por Config.IPL.groups.map_fixes_story; habilitar aqui não duplica a carga.
  heist_apartment_state = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: destroyed, normal.
  },

  -- Vangelico Jewelry Store | story.map | map_toggle
  jewelry_store_state = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: heist, normal.
  },

  -- Stilt House State | story.map | map_toggle
  stilt_house_state = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Train Bridge State | story.map | map_toggle
  train_bridge_state = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: intact, track.
  },

  -- Floyd Apartment | story.residence | teleport
  floyd_apartment = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Franklin Aunt House | story.residence | teleport
  franklin_aunt = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Franklin House | story.residence | teleport
  franklin_house = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Michael House | story.residence | ipl_entitysets
  -- Informativo: controlado por Config.IPL.groups.story_interiors; habilitar aqui não duplica a carga.
  michael_house = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Trevor Trailer | story.residence | map_toggle
  -- Informativo: controlado por Config.IPL.groups.story_interiors; habilitar aqui não duplica a carga.
  trevor_trailer = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: tidy, trash.
  },

  -- Union Depository | story.services | ipl
  -- Informativo: controlado por Config.IPL.groups.story_interiors; habilitar aqui não duplica a carga.
  union_depository = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Aircraft Carrier | story.world | ipl
  aircraft_carrier = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Cargo Ship (base) | story.world | map_toggle
  cargo_ship_base = {
    enabled = false, -- true ativa; false desativa.
    variant = "normal" -- Opções: normal, sunk.
  },

  -- North Yankton | story.world | map_toggle
  north_yankton = {
    enabled = false, -- true ativa; false desativa.
    variant = "covered" -- Opções: covered, dug, funeral.
  },

  -- Red Carpet | story.world | map_toggle
  red_carpet = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- ==========================================================
  -- SERVIÇOS, POLÍCIA, SAÚDE E GOVERNO
  -- ==========================================================

  -- Bottom Dollar Bail Office | services.bounties | ipl_entitysets
  bottom_dollar_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Doomsday Facility | services.government | ipl_entitysets
  doomsday_facility = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- IAA Facility | services.government | teleport
  iaa_facility = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- IAA Office | services.government | teleport
  iaa_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Server Farm | services.government | teleport
  server_farm = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Morgue / Coroner | services.health | ipl
  -- Informativo: controlado por Config.IPL.groups.map_fixes_story; habilitar aqui não duplica a carga.
  morgue_coroner = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Pillbox Hospital | services.health | ipl
  -- Informativo: controlado por Config.IPL.groups.map_fixes_story; habilitar aqui não duplica a carga.
  pillbox_hospital = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Psychiatrist Office | services.health | teleport
  psychiatrist_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- FIB Lobby | services.police | ipl
  -- Informativo: controlado por Config.IPL.groups.story_interiors; habilitar aqui não duplica a carga.
  fib_lobby = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- FIB Upper Floors | services.police | teleport
  fib_upper_floors = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Agents Garment Factory | services.security | ipl_entitysets
  agents_factory = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Agents Office | services.security | ipl_entitysets
  agents_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Security Garage | services.security | ipl_entitysets
  security_garage = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Security Office 1 | services.security | ipl_entitysets
  security_office_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Security Office 2 | services.security | ipl_entitysets
  security_office_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Security Office 3 | services.security | ipl_entitysets
  security_office_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Security Office 4 | services.security | ipl_entitysets
  security_office_4 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- ==========================================================
  -- EMPRESAS, ESCRITÓRIOS E GARAGENS
  -- ==========================================================

  -- Arcadius Garage 1 | business.garage | ipl_entitysets
  arcadius_garage_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Arcadius Garage 2 | business.garage | ipl_entitysets
  arcadius_garage_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Arcadius Garage 3 | business.garage | ipl_entitysets
  arcadius_garage_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Arcadius Mod Shop | business.garage | ipl_entitysets
  arcadius_mod_shop = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 10-car Garage | business.garage | teleport
  garage_10_car = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2-car Garage | business.garage | teleport
  garage_2_car = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 6-car Garage | business.garage | teleport
  garage_6_car = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lom Bank Garage 1 | business.garage | ipl_entitysets
  lom_bank_garage_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lom Bank Garage 2 | business.garage | ipl_entitysets
  lom_bank_garage_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lom Bank Garage 3 | business.garage | ipl_entitysets
  lom_bank_garage_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lom Bank Mod Shop | business.garage | ipl_entitysets
  lom_bank_mod_shop = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank Garage 1 | business.garage | ipl_entitysets
  maze_bank_garage_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank Garage 2 | business.garage | ipl_entitysets
  maze_bank_garage_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank Garage 3 | business.garage | ipl_entitysets
  maze_bank_garage_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank Mod Shop | business.garage | ipl_entitysets
  maze_bank_mod_shop = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank West Garage 1 | business.garage | ipl_entitysets
  maze_bank_west_garage_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank West Garage 2 | business.garage | ipl_entitysets
  maze_bank_west_garage_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank West Garage 3 | business.garage | ipl_entitysets
  maze_bank_west_garage_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank West Mod Shop | business.garage | ipl_entitysets
  maze_bank_west_mod_shop = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Mission Carpark | business.garage | teleport
  mission_carpark = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Arcadius Business Centre | business.office | ipl_entitysets
  arcadius_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lester Factory | business.office | teleport
  lester_factory = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lifeinvader Office | business.office | ipl
  -- Informativo: controlado por Config.IPL.groups.story_interiors; habilitar aqui não duplica a carga.
  lifeinvader = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lom Bank | business.office | ipl_entitysets
  lom_bank_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank Building | business.office | ipl_entitysets
  maze_bank_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank West | business.office | ipl_entitysets
  maze_bank_west_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Money Fronts Office | business.office | ipl_entitysets
  money_fronts_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: heli, smoke.
  },

  -- Solomon Office | business.office | teleport
  solomon_office = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Criminal Enterprise Vehicle Warehouse | business.vehicles | ipl_entitysets
  criminal_enterprise_vehicle_warehouse = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Simeon Showroom | business.vehicles | ipl_entitysets
  -- Informativo: controlado por Config.IPL.groups.story_interiors; habilitar aqui não duplica a carga.
  simeon_showroom = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: destroyed, normal.
  },

  -- Import/Export Vehicle Warehouse | business.vehicles | ipl_entitysets
  vehicle_warehouse = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Criminal Enterprise Warehouse | business.warehouse | ipl_entitysets
  criminal_enterprise_warehouse = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- ==========================================================
  -- ORGANIZAÇÕES E ATIVIDADES CRIMINAIS
  -- ==========================================================

  -- Biker Clubhouse 1 | criminal.biker | ipl_entitysets
  biker_clubhouse_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Biker Clubhouse 2 | criminal.biker | ipl_entitysets
  biker_clubhouse_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Cocaine Lockup | criminal.biker | ipl_entitysets
  cocaine_lockup = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Counterfeit Cash | criminal.biker | ipl_entitysets
  counterfeit_cash = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Document Forgery | criminal.biker | ipl_entitysets
  document_forgery = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Lost MC Compound | criminal.biker | world
  lost_mc = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Meth Lab | criminal.biker | ipl_entitysets
  meth_lab = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Weed Farm | criminal.biker | ipl_entitysets
  weed_farm = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Gunrunning Bunker | criminal.bunker | ipl_entitysets
  gunrunning_bunker = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Kosatka / Submarine | criminal.cayo | teleport
  kosatka_submarine = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Drug Wars Garage | criminal.drug_wars | ipl_entitysets
  drug_wars_garage = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Drug Wars Acid Lab | criminal.drug_wars | teleport
  drug_wars_lab = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Freakshop | criminal.drug_wars | ipl_entitysets
  freakshop = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Smuggler Hangar | criminal.hangar | ipl_entitysets
  smuggler_hangar = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Mercenaries Club | criminal.mercenaries | teleport
  mercenaries_club = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Mercenaries Lab | criminal.mercenaries | teleport
  mercenaries_lab = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- O’Neil Farm | criminal.story | map_toggle
  oneil_farm = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Tuner Meth Lab | criminal.tuner | teleport
  tuner_meth_lab = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Madrazo Ranch | criminal.world | world
  madrazo_ranch = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- ==========================================================
  -- ENTRETENIMENTO, CASSINO E CLUBES
  -- ==========================================================

  -- Arcade Garage | entertainment.arcade | ipl_entitysets
  arcade_garage = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Diamond Arcade | entertainment.arcade | teleport
  diamond_arcade = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Arcade Basement | entertainment.arcade | teleport
  diamond_arcade_basement = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Casino Car Park | entertainment.casino | ipl
  casino_carpark = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Casino Loading Bay Garage | entertainment.casino | ipl
  casino_garage = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Casino Penthouse | entertainment.casino | ipl_entitysets
  casino_penthouse = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Diamond Casino | entertainment.casino | ipl
  diamond_casino = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Vanilla Unicorn | entertainment.club | teleport
  vanilla_unicorn = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- After Hours Nightclub | entertainment.nightclub | ipl_entitysets
  after_hours_nightclub = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: edgy, glam, traditional.
  },

  -- Bahama Mamas | entertainment.nightclub | ipl
  -- Informativo: controlado por Config.IPL.groups.map_fixes_story; habilitar aqui não duplica a carga.
  bahama_mamas = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- The Music Locker | entertainment.nightclub | ipl_entitysets
  music_locker = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Opções: keinemusik, moodymann, palmstraxx.
  },

  -- Nightclub Warehouse / Garage | entertainment.nightclub | teleport
  nightclub_warehouse = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Recording Studio | entertainment.studio | teleport
  recording_studio = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- LS Car Meet | entertainment.vehicles | ipl_entitysets
  ls_car_meet = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Movie Theatre | entertainment.world | world
  movie_theatre = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Maze Bank Arena / Stadium | entertainment.world | world
  stadium = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Dignity Yacht | entertainment.yacht | ipl
  -- Informativo: controlado por Config.IPL.groups.dignity_yacht; habilitar aqui não duplica a carga.
  dignity_yacht = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Gunrunning Party Yacht | entertainment.yacht | ipl
  -- Informativo: controlado por Config.IPL.groups.gunrunning_yacht; habilitar aqui não duplica a carga.
  party_yacht = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- ==========================================================
  -- RESIDÊNCIAS E APARTAMENTOS
  -- ==========================================================

  -- Customizable Apartment | residences.apartment | teleport
  customizable_apartment = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Eclipse Penthouse Suite 1 | residences.apartment | teleport
  executive_apartment_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Eclipse Penthouse Suite 2 | residences.apartment | teleport
  executive_apartment_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Eclipse Penthouse Suite 3 | residences.apartment | teleport
  executive_apartment_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 4 Integrity Way Apt 30 | residences.apartment | teleport
  high_end_apartment_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Del Perro Heights Apt 7 | residences.apartment | teleport
  high_end_apartment_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Del Perro Heights Apt 4 | residences.apartment | teleport
  high_life_apartment_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Richard Majestic Apt 2 | residences.apartment | teleport
  high_life_apartment_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Tinsel Towers Apt 42 | residences.apartment | teleport
  high_life_apartment_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Eclipse Towers Apt 3 | residences.apartment | teleport
  high_life_apartment_4 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 4 Integrity Way Apt 28 | residences.apartment | teleport
  high_life_apartment_5 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- High Life Apartment 6 | residences.apartment | teleport
  high_life_apartment_6 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Low-end Apartment | residences.apartment | teleport
  low_end_apartment = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Medium-end Apartment | residences.apartment | teleport
  medium_end_apartment = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Residential Garages | residences.garage | teleport
  residential_garages = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 3655 Wild Oats Drive | residences.house | teleport
  high_end_house_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2044 North Conker Avenue | residences.house | teleport
  high_end_house_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2045 North Conker Avenue | residences.house | teleport
  high_end_house_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2862 Hillcrest Avenue | residences.house | teleport
  high_end_house_4 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2868 Hillcrest Avenue | residences.house | teleport
  high_end_house_5 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2874 Hillcrest Avenue | residences.house | teleport
  high_end_house_6 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2677 Whispymound Drive | residences.house | teleport
  high_end_house_7 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- 2133 Mad Wayne Thunder | residences.house | teleport
  high_end_house_8 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- ==========================================================
  -- DLCS RECENTES
  -- ==========================================================

  -- Agents Airstrip | dlc.agents | map_toggle
  agents_airstrip = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Bottom Dollar Carrier | dlc.bounties | ipl
  bottom_dollar_carrier = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Chop Shop Cargo Ship | dlc.chop_shop | ipl
  chop_shop_cargo_ship = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Chop Shop Cartel Garage | dlc.chop_shop | teleport
  chop_shop_cartel_garage = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Chop Shop Salvage Yard | dlc.chop_shop | ipl_entitysets
  chop_shop_salvage_yard = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Money Fronts Car Wash | dlc.money_fronts | teleport
  money_fronts_carwash = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- The Vinewood Residence | dlc.safehouse_hills | ipl_entitysets
  safehouse_mansion_1 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Richman Villa | dlc.safehouse_hills | ipl_entitysets
  safehouse_mansion_2 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Tongva Estate | dlc.safehouse_hills | ipl_entitysets
  safehouse_mansion_3 = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Safehouse Mansion Basements | dlc.safehouse_hills | teleport
  safehouse_mansion_basements = {
    enabled = false, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

  -- Los Santos Tuners Garage | dlc.tuners | ipl_entitysets
  tuner_garage = {
    enabled = true, -- true ativa; false desativa.
    variant = nil -- Esta entrada não possui variantes.
  },

}

-- Aplica as escolhas acima depois que todos os arquivos do catálogo carregaram.
for key, settings in pairs(Config.IPLCatalogSettings) do
  local entry = Config.IPLCatalog[key]

  if entry then
    entry.enabled = settings.enabled == true

    -- nil mantém a variante padrão declarada na própria entrada.
    if settings.variant ~= nil then
      entry.activeVariant = settings.variant
    end
  elseif Config.Debug == true then
    print(('[mz_settings] Catálogo: chave não encontrada em settings.lua: %s'):format(tostring(key)))
  end
end
