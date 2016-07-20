local composer = require("composer")
local scene = composer.newScene()

local sizeRatio
local colorTable
local colorValue

local menuGroup

local logoGroup
local logoR
local logoG
local logoB

local playGroup
local playButtonR
local playButtonG
local playButtonB
local playTextR
local playTextG
local playTextB

function scene:create(event)
    menuGroup = self.view

    --==Variables Go Here ==--
    sizeRatio = composer.getVariable("ratio")
    colorValue = composer.getVariable("colorValue")

    if colorValue == "rgb" then
        colorTable = {
            red = {1, 0, 0},
            green = {0, 1, 0},
            blue = {0, 0, 1}
        }
    elseif colorValue == "red" then
        colorTable = {
            red = {0.4, 0, 0},
            green = {0.7, 0, 0},
            blue = {1, 0, 0}
        }
    elseif colorValue == "blue" then
        colorTable = {
            red = {0, 0, 0.4},
            green = {0, 0, 0.7},
            blue = {0, 0, 1}
        }
    elseif colorValue == "green" then
        colorTable = {
            red = {0, 0.4, 0},
            green = {0, 0.7, 0},
            blue = {0, 1, 0}
        }
    elseif colorValue == "pink" then
        colorTable = {
            red = {0.4, 0, 0.4},
            green = {0.7, 0, 0.7},
            blue = {1, 0, 1}
        }
    elseif colorValue == "golden" then
        colorTable = {
            red = {0.4, 0.3, 0},
            green = {0.7, 0.6, 0},
            blue = {1, 0.9, 0}
        }
    elseif colorValue == "royal" then
        colorTable = {
            red = {1, 0, 0},
            green = {1, 1, 0},
            blue = {0, 0, 1}
        }
    elseif colorValue == "reverse" then
        colorTable = {
            red = {0, 0, 1},
            green = {0, 1, 0},
            blue = {1, 0, 0}
        }
    end

    --== Logo Group ==--
    logoGroup = display.newGroup()
    logoGroup.anchorChildren = true
    logoGroup.x, logoGroup.y = W * 0.5, H * 0.075

    logoR = display.newText("R-G-B", W * 0.5, H * 0.5, "fonts/loaded.ttf", W * 0.245)
    logoR:setFillColor(unpack(colorTable.red))
    logoG = display.newText(logoR.text, logoR.x, logoR.y + (sizeRatio), "fonts/loaded.ttf", W * 0.245)
    logoG:setFillColor(unpack(colorTable.green))
    logoB = display.newText(logoR.text, logoR.x, logoG.y + (sizeRatio), "fonts/loaded.ttf", W * 0.245)
    logoB:setFillColor(unpack(colorTable.blue))

    logoGroup:insert(logoR)
    logoGroup:insert(logoG)
    logoGroup:insert(logoB)

    --== Play Group ==--
    playGroup = display.newGroup()

    menuGroup:insert(logoGroup)
end

function scene:show(event)
    local phase = event.phase

    if phase == "will" then

    elseif phase == "did" then

    end
end

function scene:hide(event)
    local phase = event.phase

    if phase == "will" then

    elseif phase == "did" then

    end
end

function scene:destroy(event)
    menuGroup:removeSelf()
    menuGroup = nil
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
