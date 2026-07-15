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

local function replacePlateTexture(plateName, txdName, textureName)
  AddReplaceTexture('vehshare', plateName, txdName, textureName)
  replacedTextures[#replacedTextures + 1] = { 'vehshare', plateName }
end

local function replaceNormalTexture(plateName, txdName, normalTextureName)
  AddReplaceTexture('vehshare', ('%s_n'):format(plateName), txdName, normalTextureName)
  replacedTextures[#replacedTextures + 1] = { 'vehshare', ('%s_n'):format(plateName) }
end

local function applyPlateTextures()
  local cfg = Config.Plates or {}
  if cfg.enabled ~= true then return end

  local txdName = tostring(cfg.txdName or 'mz_settings_plates_txd')
  local normalTextureName = tostring(cfg.normalTextureName or 'mz_settings_plate_normal')
  local normalImage = tostring(cfg.normalImage or 'placa_f.png')
  local textureDict = CreateRuntimeTxd(txdName)

  createDuiTexture(textureDict, normalTextureName, normalImage)

  for _, plate in ipairs(cfg.textures or {}) do
    if plate.enabled == true and plate.plate and plate.texture and plate.image then
      createDuiTexture(textureDict, plate.texture, plate.image)
      replacePlateTexture(plate.plate, txdName, plate.texture)
      replaceNormalTexture(plate.plate, txdName, normalTextureName)
    end
  end
end

CreateThread(function()
  Wait(tonumber((Config.Plates or {}).waitBeforeApplyMs) or 500)
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
