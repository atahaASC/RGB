local composer = require("composer")
local scene = composer.newScene()

local modeGroup
local modeStatus
local sizeRatio
local colorValue
local colorTable
local dataManagement

local titleGroup
local titleR
local titleG
local titleB

local normalGroup
local normalR
local normalG
local normalB
local normalTextR
local normalTextG
local normalTextB

function scene:create(event)
    modeGroup = self.view

    --== Create Variables ==--
    sizeRatio = composer.getVariable("ratio")
    colorValue = composer.getVariable("colorValue")
    modeStatus = 1

    dataManagement = event.params.dataFunction

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

    --== Create Title Group ==--
    titleGroup = display.newGroup()
    titleGroup.anchorChildren = true
    titleGroup.x, titleGroup.y = W * 0.5, H * 0.075

    titleR = display.newText("modes", W * 0.5, H * 0.5, "fonts/loaded.ttf", W * 0.18)
    titleR:setFillColor(unpack(colorTable.red))
    titleG = display.newText(titleR.text, titleR.x, titleR.y + sizeRatio, "fonts/loaded.ttf", W * 0.18)
    titleG:setFillColor(unpack(colorTable.green))
    titleB = display.newText(titleR.text, titleR.x, titleG.y + sizeRatio, "fonts/loaded.ttf", W * 0.18)
    titleB:setFillColor(unpack(colorTable.blue))

    titleGroup:insert(titleR)
    titleGroup:insert(titleG)
    titleGroup:insert(titleB)

    --== Normal Button Group ==--
    normalGroup = display.newGroup()
    normalGroup.anchorChildren = true
    normalGroup.x, normalGroup.y = W * 0.5, H * 0.3

    normalR = display.newRect(W * 0.5, H * 0.5, W * 0.75, H * 0.085)
    normalR:setFillColor(0.1, 0.1, 0.1, 0.9)
    normalR.strokeWidth = sizeRatio
    normalR:setStrokeColor(unpack(colorTable.red))
    normalG = display.newRect(normalR.x, normalR.y, normalR.width, normalR.height)
    normalG:setFillColor(0, 0, 0, 0)
    normalG.strokeWidth = sizeRatio * 2
    normalG:setStrokeColor(unpack(colorTable.red))
    normalG.alpha = 0.55
    normalB = display.newRect(normalR.x, normalR.y, normalR.width, normalR.height)
    normalB:setFillColor(0, 0, 0, 0)
    normalB.strokeWidth = sizeRatio * 4
    normalB:setStrokeColor(unpack(colorTable.red))
    normalB.alpha = 0.4
    normalTextR = display.newText("normal", normalR.x, normalR.y - sizeRatio, "fonts/loaded.ttf", W * 0.09)
    normalTextR:setFillColor(unpack(colorTable.red))
    normalTextR.alpha  = 0.4
    normalTextG = display.newText(normalTextR.text, normalR.x, normalR.y, "fonts/loaded.ttf", W * 0.09)
    normalTextG:setFillColor(unpack(colorTable.red))
    normalTextG.alpha = 0.55
    normalTextB = display.newText(normalTextR.text, normalR.x, normalR.y + sizeRatio, "fonts/loaded.ttf", W * 0.09)
    normalTextB:setFillColor(unpack(colorTable.red))
    normalTextB.alpha = 1

    normalGroup:insert(normalB)
    normalGroup:insert(normalG)
    normalGroup:insert(normalR)
    normalGroup:insert(normalTextR)
    normalGroup:insert(normalTextG)
    normalGroup:insert(normalTextB)

    --== Zero-G Button Group ==--
    zeroGroup = display.newGroup()
    zeroGroup.anchorChildren = true
    zeroGroup.x, zeroGroup.y = W * 0.5, normalGroup.y + (H * 0.15)

    zeroR = display.newRect(W * 0.5, H * 0.5, W * 0.75, H * 0.085)
    zeroR:setFillColor(0.1, 0.1, 0.1, 0.9)
    zeroR.strokeWidth = sizeRatio
    zeroR:setStrokeColor(unpack(colorTable.green))
    zeroG = display.newRect(zeroR.x, zeroR.y, zeroR.width, zeroR.height)
    zeroG:setFillColor(0, 0, 0, 0)
    zeroG.strokeWidth = sizeRatio * 2
    zeroG:setStrokeColor(unpack(colorTable.green))
    zeroG.alpha = 0.55
    zeroB = display.newRect(zeroR.x, zeroR.y, zeroR.width, zeroR.height)
    zeroB:setFillColor(0, 0, 0, 0)
    zeroB.strokeWidth = sizeRatio * 4
    zeroB:setStrokeColor(unpack(colorTable.green))
    zeroB.alpha = 0.4
    zeroTextR = display.newText("zero", zeroR.x, zeroR.y - sizeRatio, "fonts/loaded.ttf", W * 0.09)
    zeroTextR:setFillColor(unpack(colorTable.green))
    zeroTextR.alpha  = 0.4
    zeroTextG = display.newText(zeroTextR.text, zeroR.x, zeroR.y, "fonts/loaded.ttf", W * 0.09)
    zeroTextG:setFillColor(unpack(colorTable.green))
    zeroTextG.alpha = 0.55
    zeroTextB = display.newText(zeroTextR.text, zeroR.x, zeroR.y + sizeRatio, "fonts/loaded.ttf", W * 0.09)
    zeroTextB:setFillColor(unpack(colorTable.green))
    zeroTextB.alpha = 1

    zeroGroup:insert(zeroB)
    zeroGroup:insert(zeroG)
    zeroGroup:insert(zeroR)
    zeroGroup:insert(zeroTextR)
    zeroGroup:insert(zeroTextG)
    zeroGroup:insert(zeroTextB)

    --== Time Button Group ==--
    timeGroup = display.newGroup()
    timeGroup.anchorChildren = true
    timeGroup.x, timeGroup.y = W * 0.5, zeroGroup.y + (H * 0.15)

    timeR = display.newRect(W * 0.5, H * 0.5, W * 0.75, H * 0.085)
    timeR:setFillColor(0.1, 0.1, 0.1, 0.9)
    timeR.strokeWidth = sizeRatio
    timeR:setStrokeColor(unpack(colorTable.blue))
    timeG = display.newRect(timeR.x, timeR.y, timeR.width, timeR.height)
    timeG:setFillColor(0, 0, 0, 0)
    timeG.strokeWidth = sizeRatio * 2
    timeG:setStrokeColor(unpack(colorTable.blue))
    timeG.alpha = 0.55
    timeB = display.newRect(timeR.x, timeR.y, timeR.width, timeR.height)
    timeB:setFillColor(0, 0, 0, 0)
    timeB.strokeWidth = sizeRatio * 4
    timeB:setStrokeColor(unpack(colorTable.blue))
    timeB.alpha = 0.4
    timeTextR = display.newText("time", timeR.x, timeR.y - sizeRatio, "fonts/loaded.ttf", W * 0.09)
    timeTextR:setFillColor(unpack(colorTable.blue))
    timeTextR.alpha  = 0.4
    timeTextG = display.newText(timeTextR.text, timeR.x, timeR.y, "fonts/loaded.ttf", W * 0.09)
    timeTextG:setFillColor(unpack(colorTable.blue))
    timeTextG.alpha = 0.55
    timeTextB = display.newText(timeTextR.text, timeR.x, timeR.y + sizeRatio, "fonts/loaded.ttf", W * 0.09)
    timeTextB:setFillColor(unpack(colorTable.blue))
    timeTextB.alpha = 1

    timeGroup:insert(timeB)
    timeGroup:insert(timeG)
    timeGroup:insert(timeR)
    timeGroup:insert(timeTextR)
    timeGroup:insert(timeTextG)
    timeGroup:insert(timeTextB)

    modeGroup:insert(titleGroup)
    modeGroup:insert(normalGroup)
    modeGroup:insert(zeroGroup)
    modeGroup:insert(timeGroup)
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

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
