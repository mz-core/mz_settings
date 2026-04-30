local txdName = 'mz_settings_plates_txd'
local normalTextureName = 'mz_settings_plate_normal'

local plateTextures = {
  { plate = 'plate01', texture = 'mz_settings_plate_01', image = 'placaRJ.png', enabled = true },
  -- { plate = 'plate02', texture = 'mz_settings_plate_02', image = 'placa.png', enabled = true },
  -- { plate = 'plate03', texture = 'mz_settings_plate_03', image = 'sua_placa_03.png', enabled = true },
  -- { plate = 'plate04', texture = 'mz_settings_plate_04', image = 'sua_placa_04.png', enabled = true },
  -- { plate = 'plate05', texture = 'mz_settings_plate_05', image = 'sua_placa_05.png', enabled = true }
}

local duiObjects = {}
local replacedTextures = {}

local function getAssetUrl(fileName)
  return ('nui://%s/assets/%s'):format(GetCurrentResourceName(), fileName)
end

local function createDuiTexture(textureDict, textureName, fileName)
  local dui = CreateDui(getAssetUrl(fileName), 540, 300)
  local handle = GetDuiHandle(dui)

  CreateRuntimeTextureFromDuiHandle(textureDict, textureName, handle)
  duiObjects[#duiObjects + 1] = dui
end

local function replacePlateTexture(plateName, textureName)
  AddReplaceTexture('vehshare', plateName, txdName, textureName)
  replacedTextures[#replacedTextures + 1] = { 'vehshare', plateName }
end

local function replaceNormalTexture(plateName)
  AddReplaceTexture('vehshare', ('%s_n'):format(plateName), txdName, normalTextureName)
  replacedTextures[#replacedTextures + 1] = { 'vehshare', ('%s_n'):format(plateName) }
end

local function applyPlateTextures()
  local textureDict = CreateRuntimeTxd(txdName)

  createDuiTexture(textureDict, normalTextureName, 'placa_f.png')

  for _, plate in ipairs(plateTextures) do
    if plate.enabled == true then
      createDuiTexture(textureDict, plate.texture, plate.image)
      replacePlateTexture(plate.plate, plate.texture)
      replaceNormalTexture(plate.plate)
    end
  end
end

CreateThread(function()
  Wait(500)
  applyPlateTextures()
end)

AddEventHandler('onResourceStop', function(resourceName)
  if resourceName ~= GetCurrentResourceName() then
    return
  end

  for _, texture in ipairs(replacedTextures) do
    RemoveReplaceTexture(texture[1], texture[2])
  end

  for _, dui in ipairs(duiObjects) do
    DestroyDui(dui)
  end
end)
