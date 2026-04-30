MZSettings = MZSettings or {}

local function debugPrint(message)
  if Config and Config.Debug then
    print(('[mz_settings] %s'):format(tostring(message)))
  end
end

function MZSettings.Debug(message)
  debugPrint(message)
end

function MZSettings.ClampNumber(value, minValue, maxValue, fallback)
  local number = tonumber(value)
  if number == nil then number = fallback or minValue end
  if number < minValue then return minValue end
  if number > maxValue then return maxValue end
  return number
end

CreateThread(function()
  Wait(500)
  debugPrint('client iniciado')
end)
