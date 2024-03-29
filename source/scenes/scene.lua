local pd <const> = playdate
local gfx <const> = pd.graphics

Scene = {}
Scene.__index = Scene

function Scene.new()
  local self = gfx.sprite.new()

  function self:getMenuImage()
    local image = gfx.image.new(400, 240)

    return image
  end

  function self:getMenuOptions()
    local menuOptions = {}

    table.insert(menuOptions, {
      label = "option",
      callback = function()

      end
    })

    return menuOptions
  end

  return self
end
