import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "globals"

import "icon"

import "settings/Settings"

import "scenes/Scene"
import "scenes/SceneManager"

local pd <const> = playdate
local gfx <const> = pd.graphics

math.randomseed(playdate.getSecondsSinceEpoch())
pd.display.setRefreshRate(30)

Settings.loadFromDatastore()
SCENE_MANAGER = SceneManager.new()

function pd.gameWillPause()
    pd.setMenuImage(SCENE_MANAGER.scene:getMenuImage())
end

function pd.update()
    local sprite = gfx.sprite

    sprite.update()
    pd.timer.updateTimers()

    if DEVELOPER_MODE then
        pd.drawFPS(0, 1)
    end
end
