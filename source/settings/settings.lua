local pd <const> = playdate
local ds <const> = pd.datastore

Settings = {}
Settings.__index = Settings

local filename <const> = 'settings'

local DEFAULT_USER_SETTINGS = {

}

function Settings.reset()
  Settings.writeToDatastore(DEFAULT_USER_SETTINGS)
end

function Settings.writeToDatastore(settingsTable)
  ds.write(settingsTable, filename)
end

function Settings.loadFromDatastore()
  local settingsTable = ds.read(filename)

  if settingsTable == nil then
    settingsTable = DEFAULT_USER_SETTINGS
    Settings.writeToDatastore(settingsTable)
  end

  for key, _ in pairs(DEFAULT_USER_SETTINGS) do
    if settingsTable[key] ~= nil then
      USER_SETTINGS[key] = settingsTable[key]
    else
      USER_SETTINGS[key] = DEFAULT_USER_SETTINGS[key]
    end
  end

  return USER_SETTINGS
end

function Settings.updateSetting(key, value)
  local settingsTable = Settings.loadFromDatastore()
  settingsTable[key] = value
  Settings.writeToDatastore(settingsTable)
  USER_SETTINGS = settingsTable
end
