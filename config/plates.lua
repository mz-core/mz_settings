Config.Plates = Config.Plates or {
  enabled = true,
  waitBeforeApplyMs = 500,
  txdName = 'mz_settings_plates_txd',
  normalTextureName = 'mz_settings_plate_normal',
  normalImage = 'placa_f.png',

  textures = {
    {
      plate = 'plate01',
      texture = 'mz_settings_plate_01',
      image = 'placaRJ.png',
      enabled = true
    },

    -- Variante disponível, desativada por padrão.
    {
      plate = 'plate02',
      texture = 'mz_settings_plate_02',
      image = 'placa.png',
      enabled = false
    }
  }
}
