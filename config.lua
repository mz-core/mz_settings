Config = Config or {}

-- true mostra prints de debug no client/server. Use apenas para testar config.
Config.Debug = false

-- IPLs/interiores/mapas base.
-- enabled = true aplica as listas ao iniciar o resource.
-- load/remove continuam existindo para extras manuais rápidos.
-- groups separa os IPLs por finalidade para você saber o que está ativando.
-- Dica: não ative Cayo/nightclub/yachts/negócios todos de uma vez sem testar.
Config.IPL = {
  enabled = true,
  applyDelayMs = 1000,

  -- Necessário para vários mapas/interiores de GTA Online/DLC.
  loadMpDlcMaps = true,
  enableMpDlcMaps = true,

  -- Extras manuais. Use aqui para testar 1 IPL sem mexer nos grupos.
  load = {
    -- 'vw_casino_main',
    -- 'hei_dlc_windows_casino',
  },

  remove = {
    -- 'fakeint',
  },

  groups = {
    legacy_cleanup = {
      enabled = true,
      label = 'Limpeza de versões fake/destruídas',
      description = 'Remove IPLs fake, destruídos ou conflitantes antes de carregar os mapas corretos.',
      remove = {
        'hei_bi_hw1_13_door',
        'rc12b_hospitalinterior',
        'rc12b_destroyed',
        'shutter_open',
        'csr_inMission',
        'facelobbyfake',
        'CS1_02_cf_offmission',
        'FIBlobbyfake',
        'id2_14_during_door',
        'id2_14_during2',
        'id2_14_on_fire',
        'id2_14_post_no_int',
        'id2_14_pre_no_int',
        'DT1_03_Gr_Closed',
        'DT1_03_Shutter',
        'smboat',
        'sp1_10_fake_interior',
        'sp1_10_fake_interior_lod',
        'DT1_05_HC_REMOVE',
        'jewel2fake',
        'bh1_16_refurb',
        'ch1_02_closed',
        'scafstartimap',
        'bh1_16_doors_shut',
        'redcarpet',
        'farmint_cap',
        'farmint_cap_lod',
      },
    },

    map_fixes_story = {
      enabled = true,
      label = 'Correções base/story mode',
      description = 'Correções visuais do mapa vanilla: lojas, água, ponte, buracos, trailers, hospital e pequenos cenários.',
      load = {
        'coronertrash',
        'Coroner_Int_On',
        'chop_props',
        'rc12b_default',
        'CS1_02_cf_onmission1',
        'CS1_02_cf_onmission2',
        'CS1_02_cf_onmission3',
        'CS1_02_cf_onmission4',
        'id2_14_during1',
        'yogagame',
        'v_tunnel_hole',
        'railing_start',
        'SC1_01_NewBill',
        'hw1_02_newbill',
        'hw1_emissive_newbill',
        'sc1_14_newbill',
        'dt1_17_newbill',
        'SC1_01_OldBill',
        'SC1_30_Keep_Closed',
        'refit_unload',
        'post_hiest_unload',
        'occl_meth_grp1',
        'Michael_premier',
        'DT1_05_HC_REQ',
        'DT1_05_REQUEST',
        'scafendimap',
        'ferris_finale_Anim',
        'des_stilthouse_rebuild',
        'CS2_06_TriAf02',
        'CS4_08_TriAf02',
        'CS4_04_TriAf03',
        'AP1_04_TriAf01',
        'cs5_4_trains',
        'chophillskennel',
        'bnkheist_apt_dest',
        'bnkheist_apt_norm',
        'hei_sm_16_interior_v_bahama_milo_',
        'cs3_05_water_grp1',
        'cs3_05_water_grp1_lod',
        'cs3_05_water_grp2',
        'cs3_05_water_grp2_lod',
        'canyonriver01',
        'canyonriver01_lod',
        'bh1_47_joshhse_unburnt',
        'bh1_47_joshhse_unburnt_lod',
        'bkr_bi_hw1_13_int',
        'CanyonRvrShallow',
        'methtrailer_grp1',
        'lr_cs6_08_grave_closed',
        'bkr_bi_id1_23_door',
        'ch1_02_open',
        'sp1_10_real_interior',
        'sp1_10_real_interior_lod',
        'Carwash_with_spinners',
        'ch3_rd2_bishopschickengraffiti',
        'cs5_04_mazebillboardgraffiti',
        'cs5_roads_ronoilgraffiti',
      },
    },

    story_interiors = {
      enabled = true,
      label = 'Interiores story mode úteis',
      description = 'FIB, Lifeinvader, Union Depository, Simeon/car showroom, casa do Michael e trailer do Trevor.',
      load = {
        'v_rockclub',
        'v_carshowroom',
        'shr_int',
        'shutter_closed',
        'FINBANK',
        'facelobby',
        'FIBlobby',
        'FBI_colPLUG',
        'FBI_repair',
        'TrevorsMP',
        'TrevorsTrailer',
        'TrevorsTrailerTidy',
        'TrevorsTrailerTrash',
        'V_Michael',
        'V_Michael_Garage',
        'V_Michael_FameShame',
        'V_Michael_JewelHeist',
        'V_Michael_plane_ticket',
        'V_Michael_Scuba',
      },
    },

    ships = {
      enabled = false,
      label = 'Cargo ship',
      description = 'Navio cargueiro normal. Ative apenas se sua cidade usa essa área.',
      load = {
        'cargoship',
      },
    },

    dignity_yacht = {
      enabled = false,
      label = 'Iate Dignity Heist',
      description = 'Iate da missão Heist. Pode pesar e não precisa ficar ativo em cidade RP comum.',
      load = {
        'hei_yacht_heist',
        'hei_yacht_heist_Bar',
        'hei_yacht_heist_Bedrm',
        'hei_yacht_heist_Bridge',
        'hei_yacht_heist_DistantLights',
        'hei_yacht_heist_enginrm',
        'hei_yacht_heist_LODLights',
        'hei_yacht_heist_Lounge',
      },
    },

    gunrunning_yacht = {
      enabled = false,
      label = 'Iate Gunrunning',
      description = 'Iate da DLC Gunrunning. Ative só se for usar.',
      load = {
        'gr_grdlc_yacht_lod',
        'gr_grdlc_yacht_placement',
        'gr_heist_yacht2',
        'gr_heist_yacht2_bar',
        'gr_heist_yacht2_bar_lod',
        'gr_heist_yacht2_bedrm',
        'gr_heist_yacht2_bedrm_lod',
        'gr_heist_yacht2_bridge',
        'gr_heist_yacht2_bridge_lod',
        'gr_heist_yacht2_enginrm',
        'gr_heist_yacht2_enginrm_lod',
        'gr_heist_yacht2_lod',
        'gr_heist_yacht2_lounge',
        'gr_heist_yacht2_lounge_lod',
        'gr_heist_yacht2_slod',
      },
    },

    gunrunning_bunkers = {
      enabled = false,
      label = 'Bunkers Gunrunning',
      description = 'Entradas/fechamentos de bunkers e interiores Gunrunning. Ative se for usar bunker.',
      load = {
        'gr_case0_bunkerclosed',
        'gr_case1_bunkerclosed',
        'gr_case2_bunkerclosed',
        'gr_case3_bunkerclosed',
        'gr_case4_bunkerclosed',
        'gr_case5_bunkerclosed',
        'gr_case6_bunkerclosed',
        'gr_case7_bunkerclosed',
        'gr_case9_bunkerclosed',
        'gr_case10_bunkerclosed',
        'gr_case11_bunkerclosed',
        'gr_entrance_placement',
        'gr_grdlc_interior_placement',
        'gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_',
        'gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_',
      },
    },

    online_apartments_offices = {
      enabled = false,
      label = 'Apartamentos e escritórios online',
      description = 'Apartamentos high-end e escritórios executivos do GTA Online.',
      load = {
        'apa_v_mp_h_01_a',
        'apa_v_mp_h_06_b',
        'apa_v_mp_h_08_c',
        'ex_dt1_02_office_01c',
        'ex_dt1_11_office_01b',
        'ex_sm_13_office_01a',
        'ex_sm_15_office_02b',
      },
    },

    online_business = {
      enabled = false,
      label = 'Negócios online',
      description = 'Clubhouses, warehouses, import/export e interiores de negócios.',
      load = {
        'bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo',
        'bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo',
        'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo',
        'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware02_milo',
        'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware03_milo',
        'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware04_milo',
        'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware05_milo',
        'bkr_biker_interior_placement_interior_3_biker_dlc_int_ware02_milo',
        'bkr_biker_interior_placement_interior_4_biker_dlc_int_ware03_milo',
        'bkr_biker_interior_placement_interior_5_biker_dlc_int_ware04_milo',
        'bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo',
        'ex_exec_warehouse_placement_interior_1_int_warehouse_s_dlc_milo',
        'ex_exec_warehouse_placement_interior_0_int_warehouse_m_dlc_milo',
        'ex_exec_warehouse_placement_interior_2_int_warehouse_l_dlc_milo',
        'imp_impexp_interior_placement',
        'imp_impexp_interior_placement_interior_0_impexp_int_01_milo_',
        'imp_impexp_interior_placement_interior_1_impexp_intwaremed_milo_',
        'imp_impexp_interior_placement_interior_2_imptexp_mod_int_01_milo_',
        'imp_impexp_interior_placement_interior_3_impexp_int_02_milo_',
      },
    },

    nightclub_cases = {
      enabled = false,
      label = 'Nightclub / After Hours',
      description = 'IPLs de boate e variações de DJ/anúncio. Melhor escolher uma variação antes de ativar tudo.',
      load = {
        'ba_barriers_case0',
        'ba_case0_forsale',
        'ba_case0_dixon',
        'ba_case0_madonna',
        'ba_case0_solomun',
        'ba_case0_taleofus',
        'ba_barriers_case1',
        'ba_case1_forsale',
        'ba_case1_dixon',
        'ba_case1_madonna',
        'ba_case1_solomun',
        'ba_case1_taleofus',
        'ba_barriers_case2',
        'ba_case2_forsale',
        'ba_case2_dixon',
        'ba_case2_madonna',
        'ba_case2_solomun',
        'ba_case2_taleofus',
        'ba_barriers_case3',
        'ba_case3_forsale',
        'ba_case3_dixon',
        'ba_case3_madonna',
        'ba_case3_solomun',
        'ba_case3_taleofus',
        'ba_barriers_case4',
        'ba_case4_forsale',
        'ba_case4_dixon',
        'ba_case4_madonna',
        'ba_case4_solomun',
        'ba_case4_taleofus',
        'ba_barriers_case5',
        'ba_case5_forsale',
        'ba_case5_dixon',
        'ba_case5_madonna',
        'ba_case5_solomun',
        'ba_case5_taleofus',
        'ba_barriers_case6',
        'ba_case6_forsale',
        'ba_case6_dixon',
        'ba_case6_madonna',
        'ba_case6_solomun',
        'ba_case6_taleofus',
        'ba_barriers_case7',
        'ba_case7_forsale',
        'ba_case7_dixon',
        'ba_case7_madonna',
        'ba_case7_solomun',
        'ba_case7_taleofus',
        'ba_barriers_case8',
        'ba_case8_forsale',
        'ba_case8_dixon',
        'ba_case8_madonna',
        'ba_case8_solomun',
        'ba_case8_taleofus',
        'ba_barriers_case9',
        'ba_case9_forsale',
        'ba_case9_dixon',
        'ba_case9_madonna',
        'ba_case9_solomun',
        'ba_case9_taleofus',
      },
    },

    farm = {
      enabled = false,
      label = 'Fazenda / O’Neil Farm',
      description = 'Estado da fazenda/interior. Pode afetar missões/área do mapa.',
      load = {
        'des_farmhs_startimap',
        'des_farmhs_start_occl',
        'farm',
        'farmint',
        'farm_lod',
        'farm_props',
      },
    },

    cayo_perico = {
      enabled = true,
      label = 'Cayo Perico / Heist Island',
      description = 'Ilha completa da Cayo Perico. Pesado; ative junto com cayoRadar se quiser minimapa correto.',
      load = {
        'h4_mph4_terrain_occ_09',
        'h4_mph4_terrain_occ_06',
        'h4_mph4_terrain_occ_05',
        'h4_mph4_terrain_occ_01',
        'h4_mph4_terrain_occ_00',
        'h4_mph4_terrain_occ_08',
        'h4_mph4_terrain_occ_04',
        'h4_mph4_terrain_occ_07',
        'h4_mph4_terrain_occ_03',
        'h4_mph4_terrain_occ_02',
        'h4_islandx_terrain_04',
        'h4_islandx_terrain_05_slod',
        'h4_islandx_terrain_props_05_d_slod',
        'h4_islandx_terrain_02',
        'h4_islandx_terrain_props_05_a_lod',
        'h4_islandx_terrain_props_05_c_lod',
        'h4_islandx_terrain_01',
        'h4_mph4_terrain_04',
        'h4_mph4_terrain_06',
        'h4_islandx_terrain_04_lod',
        'h4_islandx_terrain_03_lod',
        'h4_islandx_terrain_props_06_a',
        'h4_islandx_terrain_props_06_a_slod',
        'h4_islandx_terrain_props_05_f_lod',
        'h4_islandx_terrain_props_06_b',
        'h4_islandx_terrain_props_05_b_lod',
        'h4_mph4_terrain_lod',
        'h4_islandx_terrain_props_05_e_lod',
        'h4_islandx_terrain_05_lod',
        'h4_mph4_terrain_02',
        'h4_islandx_terrain_props_05_a',
        'h4_mph4_terrain_01_long_0',
        'h4_islandx_terrain_03',
        'h4_islandx_terrain_props_06_b_slod',
        'h4_islandx_terrain_01_slod',
        'h4_islandx_terrain_04_slod',
        'h4_islandx_terrain_props_05_d_lod',
        'h4_islandx_terrain_props_05_f_slod',
        'h4_islandx_terrain_props_05_c',
        'h4_islandx_terrain_02_lod',
        'h4_islandx_terrain_06_slod',
        'h4_islandx_terrain_props_06_c_slod',
        'h4_islandx_terrain_props_06_c',
        'h4_islandx_terrain_01_lod',
        'h4_mph4_terrain_06_strm_0',
        'h4_islandx_terrain_05',
        'h4_islandx_terrain_props_05_e_slod',
        'h4_islandx_terrain_props_06_c_lod',
        'h4_mph4_terrain_03',
        'h4_islandx_terrain_props_05_f',
        'h4_islandx_terrain_06_lod',
        'h4_mph4_terrain_01',
        'h4_islandx_terrain_06',
        'h4_islandx_terrain_props_06_a_lod',
        'h4_islandx_terrain_props_06_b_lod',
        'h4_islandx_terrain_props_05_b',
        'h4_islandx_terrain_02_slod',
        'h4_islandx_terrain_props_05_e',
        'h4_islandx_terrain_props_05_d',
        'h4_mph4_terrain_05',
        'h4_mph4_terrain_02_grass_2',
        'h4_mph4_terrain_01_grass_1',
        'h4_mph4_terrain_05_grass_0',
        'h4_mph4_terrain_01_grass_0',
        'h4_mph4_terrain_02_grass_1',
        'h4_mph4_terrain_02_grass_0',
        'h4_mph4_terrain_02_grass_3',
        'h4_mph4_terrain_04_grass_0',
        'h4_mph4_terrain_06_grass_0',
        'h4_mph4_terrain_04_grass_1',
        'island_distantlights',
        'island_lodlights',
        'h4_yacht_strm_0',
        'h4_yacht',
        'h4_yacht_long_0',
        'h4_islandx_yacht_01_lod',
        'h4_clubposter_palmstraxx',
        'h4_islandx_yacht_02_int',
        'h4_islandx_yacht_02',
        'h4_clubposter_moodymann',
        'h4_islandx_yacht_01',
        'h4_clubposter_keinemusik',
        'h4_islandx_yacht_03',
        'h4_ch2_mansion_final',
        'h4_islandx_yacht_03_int',
        'h4_yacht_critical_0',
        'h4_islandx_yacht_01_int',
        'h4_mph4_island_placement',
        'h4_islandx_mansion_vault',
        'h4_islandx_checkpoint_props',
        'h4_islandairstrip_hangar_props_slod',
        'h4_se_ipl_01_lod',
        'h4_ne_ipl_00_slod',
        'h4_se_ipl_06_slod',
        'h4_ne_ipl_00',
        'h4_se_ipl_02',
        'h4_islandx_barrack_props_lod',
        'h4_se_ipl_09_lod',
        'h4_ne_ipl_05',
        'h4_mph4_island_se_placement',
        'h4_ne_ipl_09',
        'h4_islandx_mansion_props_slod',
        'h4_se_ipl_09',
        'h4_mph4_mansion_b',
        'h4_islandairstrip_hangar_props_lod',
        'h4_islandx_mansion_entrance_fence',
        'h4_nw_ipl_09',
        'h4_nw_ipl_02_lod',
        'h4_ne_ipl_09_slod',
        'h4_sw_ipl_02',
        'h4_islandx_checkpoint',
        'h4_islandxdock_water_hatch',
        'h4_nw_ipl_04_lod',
        'h4_islandx_maindock_props',
        'h4_beach',
        'h4_islandx_mansion_lockup_03_lod',
        'h4_ne_ipl_04_slod',
        'h4_mph4_island_nw_placement',
        'h4_ne_ipl_08_slod',
        'h4_nw_ipl_09_lod',
        'h4_se_ipl_08_lod',
        'h4_islandx_maindock_props_lod',
        'h4_se_ipl_03',
        'h4_sw_ipl_02_slod',
        'h4_nw_ipl_00',
        'h4_islandx_mansion_b_side_fence',
        'h4_ne_ipl_01_lod',
        'h4_se_ipl_06_lod',
        'h4_ne_ipl_03',
        'h4_islandx_maindock',
        'h4_se_ipl_01',
        'h4_sw_ipl_07',
        'h4_islandx_maindock_props_2',
        'h4_islandxtower_veg',
        'h4_mph4_island_sw_placement',
        'h4_se_ipl_01_slod',
        'h4_mph4_wtowers',
        'h4_se_ipl_02_lod',
        'h4_islandx_mansion',
        'h4_nw_ipl_04',
        'h4_mph4_airstrip_interior_0_airstrip_hanger',
        'h4_islandx_mansion_lockup_01',
        'h4_islandx_barrack_props',
        'h4_nw_ipl_07_lod',
        'h4_nw_ipl_00_slod',
        'h4_sw_ipl_08_lod',
        'h4_islandxdock_props_slod',
        'h4_islandx_mansion_lockup_02',
        'h4_islandx_mansion_slod',
        'h4_sw_ipl_07_lod',
        'h4_islandairstrip_doorsclosed_lod',
        'h4_sw_ipl_02_lod',
        'h4_se_ipl_04_slod',
        'h4_islandx_checkpoint_props_lod',
        'h4_se_ipl_04',
        'h4_se_ipl_07',
        'h4_mph4_mansion_b_strm_0',
        'h4_nw_ipl_09_slod',
        'h4_se_ipl_07_lod',
        'h4_islandx_maindock_slod',
        'h4_islandx_mansion_lod',
        'h4_sw_ipl_05_lod',
        'h4_nw_ipl_08',
        'h4_islandairstrip_slod',
        'h4_nw_ipl_07',
        'h4_islandairstrip_propsb_lod',
        'h4_islandx_checkpoint_props_slod',
        'h4_aa_guns_lod',
        'h4_sw_ipl_06',
        'h4_islandx_maindock_props_2_slod',
        'h4_islandx_mansion_office',
        'h4_islandx_maindock_lod',
        'h4_mph4_dock',
        'h4_islandairstrip_propsb',
        'h4_islandx_mansion_lockup_03',
        'h4_nw_ipl_01_lod',
        'h4_se_ipl_05_slod',
        'h4_sw_ipl_01_lod',
        'h4_nw_ipl_05',
        'h4_islandxdock_props_2_lod',
        'h4_ne_ipl_04_lod',
        'h4_ne_ipl_01',
        'h4_beach_party_lod',
        'h4_islandx_mansion_lights',
        'h4_sw_ipl_00_lod',
        'h4_islandx_mansion_guardfence',
        'h4_beach_props_party',
        'h4_ne_ipl_03_lod',
        'h4_islandx_mansion_b',
        'h4_beach_bar_props',
        'h4_ne_ipl_04',
        'h4_sw_ipl_08_slod',
        'h4_islandxtower',
        'h4_se_ipl_00_slod',
        'h4_islandx_barrack_hatch',
        'h4_ne_ipl_06_slod',
        'h4_ne_ipl_03_slod',
        'h4_sw_ipl_09_slod',
        'h4_ne_ipl_02_slod',
        'h4_nw_ipl_04_slod',
        'h4_ne_ipl_05_lod',
        'h4_nw_ipl_08_slod',
        'h4_sw_ipl_05_slod',
        'h4_islandx_mansion_b_lod',
        'h4_ne_ipl_08',
        'h4_islandxdock_props',
        'h4_islandairstrip_doorsopen_lod',
        'h4_se_ipl_05_lod',
        'h4_islandxcanal_props_slod',
        'h4_mansion_gate_closed',
        'h4_se_ipl_02_slod',
        'h4_nw_ipl_02',
        'h4_ne_ipl_08_lod',
        'h4_sw_ipl_08',
        'h4_islandairstrip',
        'h4_islandairstrip_props_lod',
        'h4_se_ipl_05',
        'h4_ne_ipl_02_lod',
        'h4_islandx_maindock_props_2_lod',
        'h4_sw_ipl_03_slod',
        'h4_ne_ipl_01_slod',
        'h4_beach_props_slod',
        'h4_underwater_gate_closed',
        'h4_ne_ipl_00_lod',
        'h4_islandairstrip_doorsopen',
        'h4_sw_ipl_01_slod',
        'h4_se_ipl_00',
        'h4_se_ipl_06',
        'h4_islandx_mansion_lockup_02_lod',
        'h4_islandxtower_veg_lod',
        'h4_sw_ipl_00',
        'h4_se_ipl_04_lod',
        'h4_nw_ipl_07_slod',
        'h4_islandx_mansion_props_lod',
        'h4_islandairstrip_hangar_props',
        'h4_nw_ipl_06_lod',
        'h4_islandxtower_lod',
        'h4_islandxdock_lod',
        'h4_islandxdock_props_lod',
        'h4_beach_party',
        'h4_nw_ipl_06_slod',
        'h4_islandairstrip_doorsclosed',
        'h4_nw_ipl_00_lod',
        'h4_ne_ipl_02',
        'h4_islandxdock_slod',
        'h4_se_ipl_07_slod',
        'h4_islandxdock',
        'h4_islandxdock_props_2_slod',
        'h4_islandairstrip_props',
        'h4_sw_ipl_09',
        'h4_ne_ipl_06',
        'h4_se_ipl_03_lod',
        'h4_nw_ipl_03',
        'h4_islandx_mansion_lockup_01_lod',
        'h4_beach_lod',
        'h4_ne_ipl_07_lod',
        'h4_nw_ipl_01',
        'h4_mph4_island_lod',
        'h4_islandx_mansion_office_lod',
        'h4_islandairstrip_lod',
        'h4_beach_props_lod',
        'h4_nw_ipl_05_slod',
        'h4_islandx_checkpoint_lod',
        'h4_nw_ipl_05_lod',
        'h4_nw_ipl_03_slod',
        'h4_nw_ipl_03_lod',
        'h4_sw_ipl_05',
        'h4_mph4_mansion',
        'h4_sw_ipl_03',
        'h4_se_ipl_08_slod',
        'h4_mph4_island_ne_placement',
        'h4_aa_guns',
        'h4_islandairstrip_propsb_slod',
        'h4_sw_ipl_01',
        'h4_mansion_remains_cage',
        'h4_nw_ipl_01_slod',
        'h4_ne_ipl_06_lod',
        'h4_se_ipl_08',
        'h4_sw_ipl_04_slod',
        'h4_sw_ipl_04_lod',
        'h4_mph4_beach',
        'h4_sw_ipl_06_lod',
        'h4_sw_ipl_06_slod',
        'h4_se_ipl_00_lod',
        'h4_ne_ipl_07_slod',
        'h4_mph4_mansion_strm_0',
        'h4_nw_ipl_02_slod',
        'h4_mph4_airstrip',
        'h4_mansion_gate_broken',
        'h4_island_padlock_props',
        'h4_islandairstrip_props_slod',
        'h4_nw_ipl_06',
        'h4_sw_ipl_09_lod',
        'h4_islandxcanal_props_lod',
        'h4_ne_ipl_05_slod',
        'h4_se_ipl_09_slod',
        'h4_islandx_mansion_vault_lod',
        'h4_se_ipl_03_slod',
        'h4_nw_ipl_08_lod',
        'h4_islandx_barrack_props_slod',
        'h4_islandxtower_veg_slod',
        'h4_sw_ipl_04',
        'h4_islandx_mansion_props',
        'h4_islandxtower_slod',
        'h4_beach_props',
        'h4_islandx_mansion_b_slod',
        'h4_islandx_maindock_props_slod',
        'h4_sw_ipl_07_slod',
        'h4_ne_ipl_07',
        'h4_islandxdock_props_2',
        'h4_ne_ipl_09_lod',
        'h4_islandxcanal_props',
        'h4_beach_slod',
        'h4_sw_ipl_00_slod',
        'h4_sw_ipl_03_lod',
        'h4_islandx_disc_strandedshark',
        'h4_islandx_disc_strandedshark_lod',
        'h4_islandx',
        'h4_islandx_props_lod',
        'h4_mph4_island_strm_0',
        'h4_islandx_sea_mines',
        'h4_mph4_island',
        'h4_boatblockers',
        'h4_mph4_island_long_0',
        'h4_islandx_disc_strandedwhale',
        'h4_islandx_disc_strandedwhale_lod',
        'h4_islandx_props',
        'h4_int_placement_h4_interior_1_dlc_int_02_h4_milo_',
        'h4_int_placement_h4_interior_0_int_sub_h4_milo_',
        'h4_int_placement_h4',
      },
    },

    misc = {
      enabled = false,
      label = 'Outros IPLs legados',
      description = 'Entradas antigas que não ficaram claras na lista original. Deixe desligado até testar.',
    },
  },

  -- Props internos. Só funcionam quando o interior existe/carregou.
  -- Use enabled = true apenas quando for usar aquele interior.
  interiors = {
    bunker_farmhouse = {
      enabled = false,
      label = 'Bunker com upgrades',
      interior = 258561,
      props = {
        'standard_bunker_set',
        'Bunker_Style_C',
        'Office_Upgrade_set',
        'Gun_schematic_set',
        'security_upgrade',
        'gun_range_lights',
        'gun_locker_upgrade',
      }
    },

    vehicle_warehouse = {
      enabled = false,
      label = 'Warehouse / garagem import-export',
      interior = 252673,
      props = {
        'urban_style_set',
        'door_blocker',
        'car_floor_hatch',
      }
    },

    counterfeit_cash = {
      enabled = false,
      label = 'Fábrica de dinheiro falso',
      interior = 247809,
      props = {
        'counterfeit_cashpile10d',
        'counterfeit_cashpile20d',
        'counterfeit_cashpile100d',
        'counterfeit_security',
        'counterfeit_upgrade_equip',
        'money_cutter',
        'special_chairs',
        'dryera_on',
        'dryera_open',
        'dryerb_on',
        'dryerb_open',
        'dryerc_on',
        'dryerc_open',
        'dryerd_on',
        'dryerd_open',
      }
    },

    cayo_submarine = {
      enabled = false,
      label = 'Interior submarino/Kosatka da Cayo',
      coords = { x = 483.2, y = 4810.5, z = -58.9 },
      props = {
        'set_int_02_decal_01',
        'set_int_02_lounge1',
        'set_int_02_cannon',
        'set_int_02_clutter1',
        'set_int_02_crewemblem',
        'set_int_02_shell',
        'set_int_02_security',
        'set_int_02_sleep',
        'set_int_02_trophy1',
        'set_int_02_paramedic_complete',
        'set_Int_02_outfit_paramedic',
        'set_Int_02_outfit_serverfarm',
      },
      colors = {
        set_int_02_decal_01 = 1,
        set_int_02_lounge1 = 1,
        set_int_02_cannon = 1,
        set_int_02_clutter1 = 1,
        set_int_02_shell = 1,
        set_int_02_security = 1,
        set_int_02_sleep = 1,
        set_int_02_trophy1 = 1,
        set_int_02_paramedic_complete = 1,
        set_Int_02_outfit_paramedic = 1,
        set_Int_02_outfit_serverfarm = 1,
      }
    }
  },

  -- Radar/minimapa da Cayo. Só precisa se ativar o grupo cayo_perico.
  cayoRadar = {
    enabled = true,
    interior = 'h4_fake_islandx',
    x = 4700.0,
    y = -5145.0,
    heading = 0
  }
}

-- NPCs, cops, wanted e dispatch.
-- enabled = false desliga todo este bloco.
-- disableCops remove cops aleatorios criados pelo GTA.
-- disableDispatch desliga chamados/servicos de emergencia nativos.
-- disableWantedLevel impede nivel de procurado.
-- disableScenarioCops reduz cops parados/em cenarios.
-- disableEmergencyServices desliga ambulancia/bombeiro/policia do dispatch.
-- disableRandomBoats/disableRandomTrains controla spawns nativos.
-- clearCopsAroundPlayer limpa cops perto do jogador a cada loop.
-- Cuidado: true pode causar NPCs/cops sumindo quando o player se aproxima.
-- loopMs define o intervalo de reaplicacao.
Config.NPC = {
  enabled = true,
  disableCops = true,
  disableDispatch = true,
  disableWantedLevel = true,
  disableScenarioCops = true,
  disableEmergencyServices = true,
  disableRandomBoats = true,
  disableRandomTrains = false,
  clearCopsAroundPlayer = false,
  clearCopsRadius = 80.0,
  loopMs = 2500
}

-- Sons, radios, musicas nativas e ambientes.
-- enabled = false desliga todo o controle de audio deste resource.
-- disableVehicleRadio desliga radio nativa dentro dos veiculos.
-- disableAmbientMusic aplica flags para reduzir musicas nativas do GTA.
-- disablePoliceScanner desliga scanner de policia.
-- disableFrontendRadio desliga controle/radio da interface nativa.
-- disableStaticEmitters aplica staticEmitters abaixo.
-- disableAmbientZones aplica ambientZones/ambientZoneLists abaixo.
-- defaultRadioStation normalmente deve ficar 'OFF'.
-- loopMs define de quanto em quanto tempo o audio e reaplicado.
Config.Sound = {
  enabled = true,
  disableVehicleRadio = true,
  disableAmbientMusic = true,
  disablePoliceScanner = true,
  disableFrontendRadio = true,
  disableStaticEmitters = true,
  disableAmbientZones = true,
  defaultRadioStation = 'OFF',
  loopMs = 1500,

  -- Cenas de audio nativas. Algumas ajudam a mutar transicoes, radios
  -- internas ou ambiencias especiais. Se alguma afetar demais o mapa,
  -- comente individualmente.
  audioScenes = {
    'DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE',
    'FBI_HEIST_H5_MUTE_AMBIENCE_SCENE',
    'CHARACTER_CHANGE_IN_SKY_SCENE'
  },

  -- Flags globais aplicadas quando disableAmbientMusic = true.
  -- true ativa a flag. false/ausente nao aplica.
  audioFlags = {
    DisableFlightMusic = true,
    WantedMusicDisabled = true,
    OnlyAllowScriptTriggerPoliceScanner = true
  },

  -- Static emitters sao sons fixos do mapa/interiores: musicas de bares,
  -- boates, TVs, radios e ambientes de DLC.
  -- String simples desliga o emitter.
  -- Tabela permite escolher: { name = 'NOME', enabled = false }.
  --
  -- Onde procurar nomes:
  -- 1. CodeWalker: abra .ymap/.ytyp e procure audio emitters do local.
  -- 2. OpenIV: pesquise vanilla, bahama, tequilala, casino, nightclub, bar.
  -- 3. Client/config/README do MLO.
  -- 4. Native usada: SetStaticEmitterEnabled.
  staticEmitters = {
    'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
    'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
    'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM',
  },

  -- Ambient zones sao zonas/listas de som ambiente. Nem todo bar usa isso;
  -- muitos usam static emitter. Use quando souber o nome exato da zona.
  -- enabled = false desliga a zona/lista.
  -- enabled = true liga a zona/lista.
  -- persistent = true mantem o estado persistente.
  ambientZones = {
    -- { name = 'NOME_DA_ZONA', enabled = false, persistent = true }
  },

  ambientZoneLists = {
    -- Cayo Perico/Heist Island. Nao e "bar"; controla ambiencia da ilha.
    -- Comente se nao usa a ilha/interiores dela.
    { name = 'AZL_DLC_Hei4_Island_Disabled_Zones', enabled = false, persistent = true },
    { name = 'AZL_DLC_Hei4_Island_Zones', enabled = true, persistent = true },

    -- { name = 'NOME_DA_LISTA', enabled = false, persistent = true }
  }
}

-- Densidade de veiculos. Estes multiplicadores precisam rodar por frame.
-- 0.0 remove quase tudo; 1.0 e densidade normal do GTA.
-- vehicleDensity controla trafego geral.
-- randomVehicleDensity controla veiculos aleatorios.
-- parkedVehicleDensity controla veiculos estacionados.
-- emergency/boat/train ficam documentados para uso futuro; nem todos sao
-- aplicados por native neste resource ainda.
-- disableVehicleDistantLights remove luzes distantes artificiais de veiculos.
-- parkedVehicles controla o numero absoluto de veiculos estacionados.
-- garbageTrucks/randomBoats/randomTrains controlam spawns nativos especificos.
-- distantCopCarSirens controla sirenes distantes sem viatura visivel.
Config.Traffic = {
  enabled = true,
  vehicleDensity = 0.20,
  randomVehicleDensity = 0.10,
  parkedVehicleDensity = 0.10,
  emergencyVehicleDensity = 0.0,
  boatDensity = 0.0,
  trainDensity = 0.0,
  parkedVehicles = 0,
  garbageTrucks = false,
  randomBoats = false,
  randomTrains = false,
  disableVehicleDistantLights = true,
  distantCopCarSirens = false
}

-- Densidade de pedestres. Estes multiplicadores precisam rodar por frame.
-- pedDensity controla pedestres comuns.
-- scenarioPedDensity controla pedestres de cenarios/parados.
-- pedPopulationBudget/vehiclePopulationBudget controlam o orcamento global
-- de entidades do GTA. 0 deixa a cidade muito vazia; valores baixos evitam
-- excesso sem causar sumico brusco.
Config.Peds = {
  enabled = true,
  pedDensity = 0.20,
  scenarioPedDensity = 0.10,
  pedPopulationBudget = 2,
  vehiclePopulationBudget = 2
}

-- Regras gerais do mundo.
-- disableWeaponDrops impede NPCs de derrubarem armas.
-- disableHealthRecharge impede regeneracao de vida nativa.
-- disableAutoHelmet impede capacete automatico em motos.
-- disablePlayerWanted reforca wanted level em zero.
-- disableCover impede o jogador de grudar em cobertura nativa.
-- disableRandomEvents remove eventos aleatorios nativos.
-- deepOceanScaler = 0.0 remove o mar profundo exagerado; ajuste com cuidado.
-- removePickups remove pickups listados em Config.Pickups.
Config.World = {
  enabled = true,
  disableWeaponDrops = true,
  disableHealthRecharge = true,
  disableAutoHelmet = true,
  disablePlayerWanted = true,
  disableCover = true,
  disableRandomEvents = true,
  deepOceanScaler = 0.0,
  maxWantedLevel = 0,
  removePickups = true,
  loopMs = 1500,

  -- Scenario types controlam cenarios nativos do mundo.
  -- false desativa o tipo; true ativa/permite.
  scenarioTypes = {
    -- Lista principal: reduz veiculos/cenarios indesejados sem apagar peds
    -- manualmente perto do jogador.
    WORLD_VEHICLE_ATTRACTOR = false,
    WORLD_VEHICLE_AMBULANCE = false,
    WORLD_VEHICLE_BIKE_OFF_ROAD_RACE = false,
    WORLD_VEHICLE_BROKEN_DOWN = false,
    WORLD_VEHICLE_FIRE_TRUCK = false,
    WORLD_VEHICLE_HELI_LIFEGUARD = false,
    WORLD_VEHICLE_POLICE = false,
    WORLD_VEHICLE_STREETRACE = false,
    WORLD_VEHICLE_SALTON_DIRT_BIKE = false,
    WORLD_VEHICLE_SALTON = false,
    WORLD_VEHICLE_POLICE_NEXT_TO_CAR = false,
    WORLD_VEHICLE_POLICE_CAR = false,
    WORLD_VEHICLE_POLICE_BIKE = false,
    WORLD_VEHICLE_MILITARY_PLANES_SMALL = false,
    WORLD_VEHICLE_MILITARY_PLANES_BIG = false,
    WORLD_VEHICLE_MECHANIC = false,
    WORLD_VEHICLE_EMPTY = false,
    WORLD_VEHICLE_BUSINESSMEN = false,
    WORLD_VEHICLE_BIKE_OFF_ROAD_RACE = false
  }
}

-- Limpeza de veiculos bloqueados no mundo.
-- Responsabilidade do mz_settings porque e controle global de entidades.
-- Use para impedir que modelos proibidos existam mesmo se forem spawnados por
-- hack, trainer, comando admin indevido ou brecha de outro script.
-- Mantenha esta lista alinhada com bloqueios de gameplay, se usar garagem.
Config.BlockedVehiclesCleanup = {
  enabled = true,
  intervalMs = 2000,
  notifyDriver = true,
  notifyCooldownMs = 8000,

  models = {
    -- Aéreos militares / armados / abusáveis
    hydra = { reason = 'military_aircraft' },
    lazer = { reason = 'military_aircraft' },
    savage = { reason = 'military_helicopter' },
    hunter = { reason = 'military_helicopter' },
    akula = { reason = 'military_helicopter' },
    annihilator = { reason = 'military_helicopter' },
    annihilator2 = { reason = 'military_helicopter' },
    buzzard = { reason = 'weaponized_helicopter' },
    valkyrie = { reason = 'weaponized_helicopter' },
    valkyrie2 = { reason = 'weaponized_helicopter' },
    conada2 = { reason = 'weaponized_helicopter' },
    seasparrow = { reason = 'weaponized_helicopter' },
    seasparrow2 = { reason = 'weaponized_helicopter' },
    seasparrow3 = { reason = 'weaponized_helicopter' },

    -- Aviões grandes / armados / troll
    avenger = { reason = 'weaponized_aircraft' },
    avenger2 = { reason = 'weaponized_aircraft' },
    avenger3 = { reason = 'weaponized_aircraft' },
    avenger4 = { reason = 'weaponized_aircraft' },
    bombushka = { reason = 'military_aircraft' },
    strikeforce = { reason = 'military_aircraft' },
    pyro = { reason = 'military_aircraft' },
    rogue = { reason = 'military_aircraft' },
    starling = { reason = 'military_aircraft' },
    molotok = { reason = 'military_aircraft' },
    nokota = { reason = 'military_aircraft' },
    alkonost = { reason = 'heavy_aircraft' },
    jet = { reason = 'heavy_aircraft' },
    titan = { reason = 'heavy_aircraft' },
    cargoplane = { reason = 'heavy_aircraft' },
    blimp = { reason = 'troll_aircraft' },
    blimp2 = { reason = 'troll_aircraft' },
    blimp3 = { reason = 'troll_aircraft' },

    -- Helicópteros de carga que hacker usa para trollar/puxar veículos
    cargobob = { reason = 'vehicle_lift_abuse' },
    cargobob2 = { reason = 'vehicle_lift_abuse' },
    cargobob3 = { reason = 'vehicle_lift_abuse' },
    cargobob4 = { reason = 'vehicle_lift_abuse' },
    skylift = { reason = 'vehicle_lift_abuse' },

    -- Tanques / militares / veículos de guerra
    rhino = { reason = 'military_vehicle' },
    khanjali = { reason = 'military_vehicle' },
    apc = { reason = 'military_vehicle' },
    chernobog = { reason = 'military_vehicle' },
    halftrack = { reason = 'military_vehicle' },
    barrage = { reason = 'military_vehicle' },
    minitank = { reason = 'military_vehicle' },
    scarab = { reason = 'military_vehicle' },
    scarab2 = { reason = 'military_vehicle' },
    scarab3 = { reason = 'military_vehicle' },
    thruster = { reason = 'military_vehicle' },
    trailersmall2 = { reason = 'anti_aircraft_trailer' },

    -- Carros/motos especiais armados ou com míssil/boost
    oppressor = { reason = 'weaponized_vehicle' },
    oppressor2 = { reason = 'weaponized_vehicle' },
    deluxo = { reason = 'weaponized_vehicle' },
    scramjet = { reason = 'weaponized_vehicle' },
    toreador = { reason = 'weaponized_vehicle' },
    stromberg = { reason = 'weaponized_vehicle' },
    vigilante = { reason = 'weaponized_vehicle' },
    ruiner2 = { reason = 'weaponized_vehicle' },
    voltic2 = { reason = 'rocket_boost_vehicle' },
    ardent = { reason = 'weaponized_vehicle' },
    jb700 = { reason = 'weaponized_vehicle' },
    jb7002 = { reason = 'weaponized_vehicle' },
    tampa3 = { reason = 'weaponized_vehicle' },

    -- Pickups / offroad armados
    insurgent3 = { reason = 'weaponized_vehicle' },
    technical = { reason = 'weaponized_vehicle' },
    technical2 = { reason = 'weaponized_vehicle' },
    technical3 = { reason = 'weaponized_vehicle' },
    caracara = { reason = 'weaponized_vehicle' },
    dune3 = { reason = 'weaponized_vehicle' },
    menacer = { reason = 'weaponized_vehicle' },
    nightshark = { reason = 'armored_abuse' },

    -- Caminhões/serviço especiais abusáveis
    phantom2 = { reason = 'ram_vehicle' },
    boxville5 = { reason = 'armored_abuse' },
    speedo4 = { reason = 'weaponized_service_vehicle' },
    speedo5 = { reason = 'weaponized_service_vehicle' },
    mule4 = { reason = 'weaponized_service_vehicle' },
    pounder2 = { reason = 'weaponized_service_vehicle' },
    terbyte = { reason = 'weaponized_service_vehicle' },

    -- Arena War / veículos de troll, ram, boost e caos
    cerberus = { reason = 'arena_war_abuse' },
    cerberus2 = { reason = 'arena_war_abuse' },
    cerberus3 = { reason = 'arena_war_abuse' },
    bruiser = { reason = 'arena_war_abuse' },
    bruiser2 = { reason = 'arena_war_abuse' },
    bruiser3 = { reason = 'arena_war_abuse' },
    brutus = { reason = 'arena_war_abuse' },
    brutus2 = { reason = 'arena_war_abuse' },
    brutus3 = { reason = 'arena_war_abuse' },
    monster3 = { reason = 'arena_war_abuse' },
    monster4 = { reason = 'arena_war_abuse' },
    monster5 = { reason = 'arena_war_abuse' },
    imperator = { reason = 'arena_war_abuse' },
    imperator2 = { reason = 'arena_war_abuse' },
    imperator3 = { reason = 'arena_war_abuse' },
    deathbike = { reason = 'arena_war_abuse' },
    deathbike2 = { reason = 'arena_war_abuse' },
    deathbike3 = { reason = 'arena_war_abuse' },
    slamvan4 = { reason = 'arena_war_abuse' },
    slamvan5 = { reason = 'arena_war_abuse' },
    slamvan6 = { reason = 'arena_war_abuse' },
    dominator4 = { reason = 'arena_war_abuse' },
    dominator5 = { reason = 'arena_war_abuse' },
    dominator6 = { reason = 'arena_war_abuse' },
    zr380 = { reason = 'arena_war_abuse' },
    zr3802 = { reason = 'arena_war_abuse' },
    zr3803 = { reason = 'arena_war_abuse' },
    issi4 = { reason = 'arena_war_abuse' },
    issi5 = { reason = 'arena_war_abuse' },
    issi6 = { reason = 'arena_war_abuse' },
    impaler2 = { reason = 'arena_war_abuse' },
    impaler3 = { reason = 'arena_war_abuse' },
    impaler4 = { reason = 'arena_war_abuse' },

    -- Ramp / empurrão / troll
    dune4 = { reason = 'ram_vehicle' },
    dune5 = { reason = 'ram_vehicle' },
    wastelander = { reason = 'troll_vehicle' },

    -- Barcos/submarinos armados ou pesados
    dinghy5 = { reason = 'weaponized_boat' },
    kosatka = { reason = 'heavy_boat' },
    patrolboat = { reason = 'weaponized_boat' },
    submersible = { reason = 'submarine_abuse' },
    submersible2 = { reason = 'submarine_abuse' },

    -- Veículo RC / troll
    rcbandito = { reason = 'rc_troll_vehicle' },
  }
}

-- Pickups comuns que geralmente aparecem em NPCs/armas.
-- So sao removidos se Config.World.removePickups = true.
Config.Pickups = {
  'PICKUP_WEAPON_PISTOL',
  'PICKUP_WEAPON_COMBATPISTOL',
  'PICKUP_WEAPON_APPISTOL',
  'PICKUP_WEAPON_MICROSMG',
  'PICKUP_WEAPON_SMG',
  'PICKUP_WEAPON_ASSAULTRIFLE',
  'PICKUP_WEAPON_CARBINERIFLE',
  'PICKUP_WEAPON_PUMPSHOTGUN',
  'PICKUP_WEAPON_SAWNOFFSHOTGUN',
  'PICKUP_WEAPON_SNIPERRIFLE',
  'PICKUP_WEAPON_MG',
  'PICKUP_WEAPON_GRENADE',
  'PICKUP_WEAPON_MOLOTOV',
  'PICKUP_WEAPON_STICKYBOMB',
  'PICKUP_WEAPON_KNIFE',
  'PICKUP_WEAPON_BAT',
  'PICKUP_WEAPON_CROWBAR',
  'PICKUP_AMMO_BULLET_MP',
  'PICKUP_AMMO_MISSILE_MP',
  'PICKUP_AMMO_GRENADELAUNCHER_MP',
  'PICKUP_HEALTH_STANDARD',
  'PICKUP_ARMOUR_STANDARD'
}

-- Preset opcional: cidade limpa/sem NPCs.
-- Este bloco esta comentado de proposito. Para usar, copie os valores para os
-- blocos Config.Traffic e Config.Peds acima.
--
-- O que faz:
-- - reduz pedestres comuns e pedestres de cenario para 0;
-- - reduz trafego, carros aleatorios e estacionados para 0;
-- - zera budgets de populacao;
-- - evita caminho agressivo de deletar NPC perto do player.
--
-- Importante:
-- - Nao use ClearAreaOfPeds/ClearAreaOfVehicles em loop como primeira opcao.
--   Isso causa o efeito feio de NPC/veiculo sumindo na frente do jogador.
-- - Se algum NPC residual continuar aparecendo, crie depois uma limpeza suave
--   apenas para entidades distantes/fora da tela.
--
-- Config.Traffic = {
--   enabled = true,
--   vehicleDensity = 0.0,
--   randomVehicleDensity = 0.0,
--   parkedVehicleDensity = 0.0,
--   emergencyVehicleDensity = 0.0,
--   boatDensity = 0.0,
--   trainDensity = 0.0,
--   parkedVehicles = 0,
--   garbageTrucks = false,
--   randomBoats = false,
--   randomTrains = false,
--   disableVehicleDistantLights = true,
--   distantCopCarSirens = false
-- }
--
-- Config.Peds = {
--   enabled = true,
--   pedDensity = 0.0,
--   scenarioPedDensity = 0.0,
--   pedPopulationBudget = 0,
--   vehiclePopulationBudget = 0
-- }
