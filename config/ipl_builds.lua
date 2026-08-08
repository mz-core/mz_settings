Config.IPL = Config.IPL or {}

-- Pacotes pequenos e seguros de correções/adições do mapa por DLC.
-- A seleção é automática: cada pacote só é solicitado quando a build/DLC existe.
-- Referência: Bob74 IPL 2.7.0 (MIT), atualizado até The Kortz Center Heist.
Config.IPL.buildPacks = {
  {
    enabled = true,
    label = 'Cayo Perico Heist fixes',
    gameBuild = 2189,
    load = { 'h4_ch2_mansion_final' }
  },
  {
    enabled = true,
    label = 'Los Santos Drug Wars fixes',
    gameBuild = 2802,
    load = { 'xm3_collision_fixes', 'xm3_sum2_fix', 'xm3_security_fix' }
  },
  {
    enabled = true,
    label = 'San Andreas Mercenaries fixes',
    gameBuild = 2944,
    load = { 'm23_1_legacy_fixes' }
  },
  {
    enabled = true,
    label = 'The Chop Shop fixes',
    gameBuild = 3095,
    load = {
      'm23_2_acp_collision_fixes_01', 'm23_2_acp_collision_fixes_02',
      'm23_2_tug_collision', 'm23_2_hei_yacht_collision_fixes',
      'm23_2_vinewood_garage'
    }
  },
  {
    enabled = true,
    label = 'Bottom Dollar Bounties fixes',
    gameBuild = 3258,
    load = { 'm24_1_legacyfixes', 'm24_1_pizzasigns' }
  },
  {
    enabled = true,
    label = 'Agents of Sabotage fixes',
    gameBuild = 3407,
    load = { 'm24_2_legacy_fixes', 'm24_2_mp2024_02_additions' }
  },
  {
    enabled = true,
    label = 'Money Fronts fixes',
    gameBuild = 3570,
    dlcName = 'mp2025_01',
    load = {
      'm25_1_legacy_fixes', 'm25_1_mp2025_01_additions', 'm25_1_bobcat',
      'm25_1_garage', 'm25_1_quikpharma'
    }
  },
  {
    enabled = true,
    label = 'A Safehouse in the Hills fixes',
    gameBuild = 3717,
    dlcName = 'mp2025_02',
    load = { 'm25_2_knoway_sign' }
  },
  {
    enabled = true,
    label = 'The Kortz Center Heist fixes',
    gameBuild = 3889,
    dlcName = 'mp2026_01',
    load = { 'm26_1_mp2026_01_additions_critical_0' }
  }
}
