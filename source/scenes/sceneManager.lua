local pd <const> = playdate
local gfx <const> = pd.graphics

SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager.new()
  local self = {}
  local storedScenes = {}

  function self:storeSceneData(key, data)
    storedScenes[key] = data
  end

  function self:getStoredSceneData(key)
    return storedScenes[key]
  end

  function self:switchScene(scene, ...)
    self.scene = scene
    local args = { ... }
    self.sceneArgs = args

    self:loadNewScene()
    self:updateMenu()
  end

  function self:loadNewScene()
    self:cleanupScene()
    self.scene = self.scene.new(table.unpack(self.sceneArgs))
    self.scene:runDevAssertions()
  end

  function self:cleanupScene()
    gfx.sprite.removeAll()
    self:removeAllTimers()

    gfx.setDrawOffset(0, 0)
    gfx.setColor(gfx.kColorBlack)
    gfx.setImageDrawMode(gfx.kDrawModeCopy)
  end

  function self:removeAllTimers()
    local allTimers = pd.timer.allTimers()
    for _, timer in ipairs(allTimers) do
      timer:remove()
    end
  end

  function self:updateMenu()
    local menu = pd.getSystemMenu()
    menu:removeAllMenuItems()

    for _, menuItem in ipairs(self.scene:getMenuOptions()) do
      menu:addMenuItem(menuItem.label, menuItem.callback)
    end
  end

  return self
end