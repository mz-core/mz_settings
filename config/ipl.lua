Config.IPL = Config.IPL or {
  enabled = true,
  applyDelayMs = 1000,
  interiorApplyDelayMs = 250,
  loadMpDlcMaps = true,
  enableMpDlcMaps = true,
  externalLoader = 'native',
  -- Compatibilidade entre builds. Em "auto", o client usa GetGameBuildNumber().
  -- Use "manual" somente para testes; "off" restaura o comportamento legado.
  compatibility = {
    mode = 'auto',
    manualBuild = nil,
    skipUnsupported = true,
    checkDlcPresence = true,
    loadBuildFixes = true
  },
  -- Campo legado: se preenchido, funciona como manualBuild.
  serverGameBuild = nil,
  load = {},
  remove = {},

  -- As mansões da build 3717 precisam alternar o mapa genérico por distância.
  mansionLodFix = {
    enabled = true,
    distance = 200.0,
    scanDelayMs = 1000
  },

  groups = {
    legacy_cleanup = {
      enabled = true,
      label = 'Limpeza de versões fake/destruídas',
      remove = {
        'hei_bi_hw1_13_door', 'rc12b_hospitalinterior', 'rc12b_destroyed',
        'shutter_open', 'csr_inMission', 'facelobbyfake', 'CS1_02_cf_offmission',
        'FIBlobbyfake', 'id2_14_during_door', 'id2_14_during2', 'id2_14_on_fire',
        'id2_14_post_no_int', 'id2_14_pre_no_int', 'DT1_03_Gr_Closed',
        'DT1_03_Shutter', 'smboat', 'sp1_10_fake_interior',
        'sp1_10_fake_interior_lod', 'DT1_05_HC_REMOVE', 'jewel2fake',
        'bh1_16_refurb', 'ch1_02_closed', 'scafstartimap', 'bh1_16_doors_shut',
        'redcarpet', 'farmint_cap', 'farmint_cap_lod'
      }
    },

    map_fixes_story = {
      enabled = true,
      label = 'Correções base/story mode',
      activeVariant = 'heist_normal',
      overlapGroup = 'heist_apartment_state',
      variants = {
        heist_normal = {
          load = { 'bnkheist_apt_norm' },
          remove = { 'bnkheist_apt_dest' }
        },
        heist_destroyed = {
          load = { 'bnkheist_apt_dest' },
          remove = { 'bnkheist_apt_norm' }
        }
      },
      load = {
        'coronertrash', 'Coroner_Int_On', 'chop_props', 'rc12b_default',
        'CS1_02_cf_onmission1', 'CS1_02_cf_onmission2', 'CS1_02_cf_onmission3',
        'CS1_02_cf_onmission4', 'id2_14_during1', 'yogagame', 'v_tunnel_hole',
        'railing_start', 'SC1_01_NewBill', 'hw1_02_newbill',
        'hw1_emissive_newbill', 'sc1_14_newbill', 'dt1_17_newbill',
        'SC1_01_OldBill', 'SC1_30_Keep_Closed', 'refit_unload',
        'post_hiest_unload', 'occl_meth_grp1', 'Michael_premier',
        'DT1_05_HC_REQ', 'DT1_05_REQUEST', 'scafendimap', 'ferris_finale_Anim',
        'des_stilthouse_rebuild', 'CS2_06_TriAf02', 'CS4_08_TriAf02',
        'CS4_04_TriAf03', 'AP1_04_TriAf01', 'cs5_4_trains', 'chophillskennel',
        'hei_sm_16_interior_v_bahama_milo_', 'cs3_05_water_grp1',
        'cs3_05_water_grp1_lod', 'cs3_05_water_grp2', 'cs3_05_water_grp2_lod',
        'canyonriver01', 'canyonriver01_lod', 'bh1_47_joshhse_unburnt',
        'bh1_47_joshhse_unburnt_lod', 'bkr_bi_hw1_13_int', 'CanyonRvrShallow',
        'methtrailer_grp1', 'lr_cs6_08_grave_closed', 'bkr_bi_id1_23_door',
        'ch1_02_open', 'sp1_10_real_interior', 'sp1_10_real_interior_lod',
        'Carwash_with_spinners', 'ch3_rd2_bishopschickengraffiti',
        'cs5_04_mazebillboardgraffiti', 'cs5_roads_ronoilgraffiti'
      }
    },

    story_interiors = {
      enabled = true,
      label = 'Interiores story mode úteis',
      activeVariant = 'trevor_trash',
      overlapGroup = 'trevor_trailer_state',
      variants = {
        trevor_trash = {
          load = { 'TrevorsTrailerTrash' },
          remove = { 'TrevorsTrailerTidy' }
        },
        trevor_tidy = {
          load = { 'TrevorsTrailerTidy' },
          remove = { 'TrevorsTrailerTrash' }
        }
      },
      load = {
        'v_rockclub', 'v_carshowroom', 'shr_int', 'shutter_closed', 'FINBANK',
        'facelobby', 'FIBlobby', 'FBI_colPLUG', 'FBI_repair',
        'TrevorsMP', 'TrevorsTrailer',
        'V_Michael', 'V_Michael_Garage', 'V_Michael_FameShame',
        'V_Michael_JewelHeist', 'V_Michael_plane_ticket', 'V_Michael_Scuba'
      }
    },

    ships = {
      enabled = false,
      label = 'Cargo ship',
      load = { 'cargoship' }
    },

    dignity_yacht = {
      enabled = false,
      label = 'Iate Dignity Heist',
      load = {
        'hei_yacht_heist', 'hei_yacht_heist_Bar', 'hei_yacht_heist_Bedrm',
        'hei_yacht_heist_Bridge', 'hei_yacht_heist_DistantLights',
        'hei_yacht_heist_enginrm', 'hei_yacht_heist_LODLights',
        'hei_yacht_heist_Lounge'
      }
    },

    gunrunning_yacht = {
      enabled = false,
      label = 'Iate Gunrunning',
      load = {
        'gr_grdlc_yacht_lod', 'gr_grdlc_yacht_placement', 'gr_heist_yacht2',
        'gr_heist_yacht2_bar', 'gr_heist_yacht2_bar_lod',
        'gr_heist_yacht2_bedrm', 'gr_heist_yacht2_bedrm_lod',
        'gr_heist_yacht2_bridge', 'gr_heist_yacht2_bridge_lod',
        'gr_heist_yacht2_enginrm', 'gr_heist_yacht2_enginrm_lod',
        'gr_heist_yacht2_lod', 'gr_heist_yacht2_lounge',
        'gr_heist_yacht2_lounge_lod', 'gr_heist_yacht2_slod'
      }
    },

    gunrunning_bunkers = {
      enabled = false,
      label = 'Bunkers Gunrunning',
      load = {
        'gr_case0_bunkerclosed', 'gr_case1_bunkerclosed', 'gr_case2_bunkerclosed',
        'gr_case3_bunkerclosed', 'gr_case4_bunkerclosed', 'gr_case5_bunkerclosed',
        'gr_case6_bunkerclosed', 'gr_case7_bunkerclosed', 'gr_case9_bunkerclosed',
        'gr_case10_bunkerclosed', 'gr_case11_bunkerclosed', 'gr_entrance_placement',
        'gr_grdlc_interior_placement',
        'gr_grdlc_interior_placement_interior_0_grdlc_int_01_milo_',
        'gr_grdlc_interior_placement_interior_1_grdlc_int_02_milo_'
      }
    },

    online_apartments_offices = {
      enabled = false,
      label = 'Apartamentos e escritórios online',
      load = {
        'apa_v_mp_h_01_a', 'apa_v_mp_h_06_b', 'apa_v_mp_h_08_c',
        'ex_dt1_02_office_01c', 'ex_dt1_11_office_01b',
        'ex_sm_13_office_01a', 'ex_sm_15_office_02b'
      }
    },

    online_business = {
      enabled = false,
      label = 'Negócios online',
      load = {
        'bkr_biker_interior_placement_interior_0_biker_dlc_int_01_milo',
        'bkr_biker_interior_placement_interior_1_biker_dlc_int_02_milo',
        'bkr_biker_interior_placement_interior_2_biker_dlc_int_ware01_milo',
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
        'imp_impexp_interior_placement_interior_3_impexp_int_02_milo_'
      }
    },

    nightclub_cases = {
      enabled = false,
      label = 'Nightclub / After Hours',
      activeVariant = nil,
      overlapGroup = 'nightclub_exterior_case',
      variants = {}
    },

    farm = {
      enabled = false,
      label = 'Fazenda / O’Neil Farm',
      load = {
        'des_farmhs_startimap', 'des_farmhs_start_occl', 'farm', 'farmint',
        'farm_lod', 'farm_props'
      }
    },

    -- O grupo Cayo é preenchido em config/ipl_cayo.lua sem alterar sua lista.
    cayo_perico = {},

    misc = {
      enabled = false,
      label = 'Outros IPLs legados',
      load = {}
    }
  },

  interiors = {
    bunker_farmhouse = {
      enabled = false,
      label = 'Bunker com upgrades',
      interior = 258561,
      props = {
        'standard_bunker_set', 'Bunker_Style_C', 'Office_Upgrade_set',
        'Gun_schematic_set', 'security_upgrade', 'gun_range_lights',
        'gun_locker_upgrade'
      },
      disableProps = {}
    },
    vehicle_warehouse = {
      enabled = false,
      label = 'Warehouse / garagem import-export',
      interior = 252673,
      props = { 'urban_style_set', 'door_blocker', 'car_floor_hatch' },
      disableProps = {}
    },
    counterfeit_cash = {
      enabled = false,
      label = 'Fábrica de dinheiro falso',
      interior = 247809,
      props = {
        'counterfeit_cashpile10d', 'counterfeit_cashpile20d',
        'counterfeit_cashpile100d', 'counterfeit_security',
        'counterfeit_upgrade_equip', 'money_cutter', 'special_chairs',
        'dryera_on', 'dryera_open', 'dryerb_on', 'dryerb_open',
        'dryerc_on', 'dryerc_open', 'dryerd_on', 'dryerd_open'
      },
      disableProps = {}
    },
    cayo_submarine = {
      enabled = false,
      label = 'Interior submarino/Kosatka da Cayo',
      gameBuild = 2189,
      coords = { x = 483.2, y = 4810.5, z = -58.9 },
      props = {
        'set_int_02_decal_01', 'set_int_02_lounge1', 'set_int_02_cannon',
        'set_int_02_clutter1', 'set_int_02_crewemblem', 'set_int_02_shell',
        'set_int_02_security', 'set_int_02_sleep', 'set_int_02_trophy1',
        'set_int_02_paramedic_complete', 'set_Int_02_outfit_paramedic',
        'set_Int_02_outfit_serverfarm'
      },
      disableProps = {},
      colors = {
        set_int_02_decal_01 = 1, set_int_02_lounge1 = 1,
        set_int_02_cannon = 1, set_int_02_clutter1 = 1,
        set_int_02_shell = 1, set_int_02_security = 1,
        set_int_02_sleep = 1, set_int_02_trophy1 = 1,
        set_int_02_paramedic_complete = 1,
        set_Int_02_outfit_paramedic = 1,
        set_Int_02_outfit_serverfarm = 1
      }
    }
  },

  cayoRadar = {
    enabled = true,
    interior = 'h4_fake_islandx',
    x = 4700.0,
    y = -5145.0,
    heading = 0
  }
}

-- Nightclub legado: uma única localização/estado pode ser escolhida.
-- Para ativar, mantenha o grupo enabled=true e defina activeVariant='case0_forsale', por exemplo.
for case = 0, 9 do
  for _, state in ipairs({ 'forsale', 'dixon', 'madonna', 'solomun', 'taleofus' }) do
    local key = ('case%d_%s'):format(case, state)
    Config.IPL.groups.nightclub_cases.variants[key] = {
      label = ('Case %d / %s'):format(case, state),
      load = { ('ba_barriers_case%d'):format(case), ('ba_case%d_%s'):format(case, state) }
    }
  end
end
