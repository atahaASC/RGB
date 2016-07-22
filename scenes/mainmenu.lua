local composer = require("composer")
local scene = composer.newScene()

local sizeRatio
local colorTable
local colorValue

local dataManagement

local menuGroup
local menuStatus

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

local storeGroup
local storeButtonR
local storeButtonG
local storeButtonB
local storeTextR
local storeTextG
local storeTextB

local instructGroup
local instructButtonR
local instructButtonG
local instructButtonB
local instructTextR
local instructTextG
local instructTextB

local creditGroup
local creditButtonR
local creditButtonG
local creditButtonB
local creditTextR
local creditTextG
local creditTextB

local animateFunction
local animateTimer

local onPlayClick
local onStoreClick
local onTutClick
local onCreditClick

local function onCreditClick(event)
    if menuStatus == 0 then
        if event.phase == "began" then
            creditButtonR:setFillColor(0.1, 0.1, 0.1, 0.6)
            creditTextR.alpha = 0.8
            creditTextG.alpha = 0.8
            creditTextB.alpha = 0.8
        elseif event.phase == "ended" then
            creditButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            creditTextR.alpha = 1
            creditTextG.alpha = 1
            creditTextB.alpha = 1

            menuStatus = 1
        else
            creditButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            creditTextR.alpha = 1
            creditTextG.alpha = 1
            creditTextB.alpha = 1
        end
    end
end

local function onTutClick(event)
    if menuStatus == 0 then
        if event.phase == "began" then
            instructButtonR:setFillColor(0.1, 0.1, 0.1, 0.6)
            instructTextR.alpha = 0.8
            instructTextG.alpha = 0.8
            instructTextB.alpha = 0.8
        elseif event.phase == "ended" then
            instructButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            instructTextR.alpha = 1
            instructTextG.alpha = 1
            instructTextB.alpha = 1

            menuStatus = 1
        else
            instructButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            instructTextR.alpha = 1
            instructTextG.alpha = 1
            instructTextB.alpha = 1
        end
    end
end

local function onStoreClick(event)
    if menuStatus == 0 then
        if event.phase == "began" then
            storeButtonR:setFillColor(0.1, 0.1, 0.1, 0.6)
            storeTextR.alpha = 0.8
            storeTextG.alpha = 0.8
            storeTextB.alpha = 0.8
        elseif event.phase == "ended" then
            storeButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            storeTextR.alpha = 1
            storeTextG.alpha = 1
            storeTextB.alpha = 1

            menuStatus = 1
        else
            storeButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            storeTextR.alpha = 1
            storeTextG.alpha = 1
            storeTextB.alpha = 1
        end
    end
end

local function onPlayClick(event)
    if menuStatus == 0 then
        if event.phase == "began" then
            playButtonR:setFillColor(0.1, 0.1, 0.1, 0.6)
            playTextR.alpha = 0.8
            playTextG.alpha = 0.8
            playTextB.alpha = 0.8
        elseif event.phase == "ended" then
            playButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            playTextR.alpha = 1
            playTextG.alpha = 1
            playTextB.alpha = 1

            menuStatus = 1

            composer.gotoScene("scenes.modemenu", {time=400, effect="slideDown", params={lastScene="mainmenu", dataFunction=dataManagement}})
        else
            playButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
            playTextR.alpha = 1
            playTextG.alpha = 1
            playTextB.alpha = 1

        end
    end
end

local function animateFunction()
    playButtonR.rotation = playButtonR.rotation + 1
    playButtonG.rotation = playButtonR.rotation
    playButtonB.rotation = playButtonG.rotation

    if playButtonR.rotation == 360 then
        playButtonR.rotation = 0
        playButtonG.rotation = 0
        playButtonB.rotation = 0
    end
end

function scene:create(event)
    menuGroup = self.view

    --==Variables Go Here ==--
    sizeRatio = composer.getVariable("ratio")
    colorValue = composer.getVariable("colorValue")
    menuStatus = 1

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
    playGroup.anchorChildren = true
    playGroup.x, playGroup.y = W * 0.5, H * 0.33

    playButtonR = display.newRect(W * 0.5, H * 0.5, W * 0.4, W * 0.4)
    playButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
    playButtonR.strokeWidth = (sizeRatio)
    playButtonR.rotation = 45
    playButtonR:setStrokeColor(unpack(colorTable.red))
    playButtonG = display.newRect(playButtonR.x, playButtonR.y, playButtonR.width, playButtonR.height)
    playButtonG:setFillColor(0, 0, 0, 0)
    playButtonG.strokeWidth = sizeRatio * 2
    playButtonG:setStrokeColor(unpack(colorTable.green))
    playButtonG.rotation = 45
    playButtonB = display.newRect(playButtonR.x, playButtonR.y, playButtonR.width, playButtonR.height)
    playButtonB:setFillColor(0, 0, 0, 0)
    playButtonB.strokeWidth = sizeRatio * 4
    playButtonB:setStrokeColor(unpack(colorTable.blue))
    playButtonB.rotation = 45
    playTextR = display.newText("play", playButtonR.x, playButtonR.y - sizeRatio, "fonts/loaded.ttf", W * 0.125)
    playTextR:setFillColor(unpack(colorTable.red))
    playTextG = display.newText(playTextR.text, playButtonR.x, playButtonR.y, "fonts/loaded.ttf", W * 0.125)
    playTextG:setFillColor(unpack(colorTable.green))
    playTextB = display.newText(playTextR.text, playButtonR.x, playButtonR.y + sizeRatio, "fonts/loaded.ttf", W * 0.125)
    playTextB:setFillColor(unpack(colorTable.blue))

    playGroup:insert(playButtonB)
    playGroup:insert(playButtonG)
    playGroup:insert(playButtonR)
    playGroup:insert(playTextR)
    playGroup:insert(playTextG)
    playGroup:insert(playTextB)

    --== Store Button Group ==--
    storeGroup = display.newGroup()
    storeGroup.anchorChildren = true
    storeGroup.x, storeGroup.y = W * 0.5, H * 0.585

    storeButtonR = display.newRect(W * 0.5, H * 0.5, W * 0.65, H * 0.06)
    storeButtonR.strokeWidth = sizeRatio
    storeButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
    storeButtonR:setStrokeColor(unpack(colorTable.red))
    storeButtonG = display.newRect(storeButtonR.x, storeButtonR.y, storeButtonR.width, storeButtonR.height)
    storeButtonG.strokeWidth = sizeRatio * 2
    storeButtonG:setFillColor(0, 0, 0, 0)
    storeButtonG:setStrokeColor(unpack(colorTable.green))
    storeButtonB = display.newRect(storeButtonR.x, storeButtonR.y, storeButtonR.width, storeButtonR.height)
    storeButtonB:setFillColor(0, 0, 0, 0)
    storeButtonB.strokeWidth = sizeRatio * 4
    storeButtonB:setStrokeColor(unpack(colorTable.blue))
    storeTextR = display.newText("store", storeButtonR.x, storeButtonR.y - sizeRatio, "fonts/loaded.ttf", W * 0.08)
    storeTextR:setFillColor(unpack(colorTable.red))
    storeTextG = display.newText(storeTextR.text, storeButtonR.x, storeButtonR.y, "fonts/loaded.ttf", W * 0.08)
    storeTextG:setFillColor(unpack(colorTable.green))
    storeTextB = display.newText(storeTextR.text, storeTextR.x, storeButtonR.y + sizeRatio, "fonts/loaded.ttf", W * 0.08)
    storeTextB:setFillColor(unpack(colorTable.blue))
    storeTextB.alpha = 1

    storeGroup:insert(storeButtonB)
    storeGroup:insert(storeButtonG)
    storeGroup:insert(storeButtonR)
    storeGroup:insert(storeTextR)
    storeGroup:insert(storeTextG)
    storeGroup:insert(storeTextB)

    --== Instruct Group ==--
    instructGroup = display.newGroup()
    instructGroup.anchorChildren = true
    instructGroup.x, instructGroup.y = W * 0.5, storeGroup.y + (H * 0.11)

    instructButtonR = display.newRect(W * 0.5, H * 0.5, W * 0.65, H * 0.06)
    instructButtonR.strokeWidth = sizeRatio
    instructButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
    instructButtonR:setStrokeColor(unpack(colorTable.red))
    instructButtonG = display.newRect(instructButtonR.x, instructButtonR.y, instructButtonR.width, instructButtonR.height)
    instructButtonG.strokeWidth = sizeRatio * 2
    instructButtonG:setFillColor(0, 0, 0, 0)
    instructButtonG:setStrokeColor(unpack(colorTable.green))
    instructButtonB = display.newRect(instructButtonR.x, instructButtonR.y, instructButtonR.width, instructButtonR.height)
    instructButtonB:setFillColor(0, 0, 0, 0)
    instructButtonB.strokeWidth = sizeRatio * 4
    instructButtonB:setStrokeColor(unpack(colorTable.blue))
    instructTextR = display.newText("tutorial", instructButtonR.x, instructButtonR.y - sizeRatio, "fonts/loaded.ttf", W * 0.08)
    instructTextR:setFillColor(unpack(colorTable.red))
    instructTextG = display.newText(instructTextR.text, instructButtonR.x, instructButtonR.y, "fonts/loaded.ttf", W * 0.08)
    instructTextG:setFillColor(unpack(colorTable.green))
    instructTextB = display.newText(instructTextR.text, instructTextR.x, instructButtonR.y + sizeRatio, "fonts/loaded.ttf", W * 0.08)
    instructTextB:setFillColor(unpack(colorTable.blue))
    instructTextB.alpha = 1

    instructGroup:insert(instructButtonB)
    instructGroup:insert(instructButtonG)
    instructGroup:insert(instructButtonR)
    instructGroup:insert(instructTextR)
    instructGroup:insert(instructTextG)
    instructGroup:insert(instructTextB)

    --== Credit Button Group ==--
    creditGroup = display.newGroup()
    creditGroup.anchorChildren = true
    creditGroup.x, creditGroup.y = W * 0.5, instructGroup.y + (H * 0.11)

    creditButtonR = display.newRect(W * 0.5, H * 0.5, W * 0.65, H * 0.06)
    creditButtonR.strokeWidth = sizeRatio
    creditButtonR:setFillColor(0.1, 0.1, 0.1, 0.9)
    creditButtonR:setStrokeColor(unpack(colorTable.red))
    creditButtonG = display.newRect(creditButtonR.x, creditButtonR.y, creditButtonR.width, creditButtonR.height)
    creditButtonG.strokeWidth = sizeRatio * 2
    creditButtonG:setFillColor(0, 0, 0, 0)
    creditButtonG:setStrokeColor(unpack(colorTable.green))
    creditButtonB = display.newRect(creditButtonR.x, creditButtonR.y, creditButtonR.width, creditButtonR.height)
    creditButtonB:setFillColor(0, 0, 0, 0)
    creditButtonB.strokeWidth = sizeRatio * 4
    creditButtonB:setStrokeColor(unpack(colorTable.blue))
    creditTextR = display.newText("credits", creditButtonR.x, creditButtonR.y - sizeRatio, "fonts/loaded.ttf", W * 0.08)
    creditTextR:setFillColor(unpack(colorTable.red))
    creditTextG = display.newText(creditTextR.text, creditButtonR.x, creditButtonR.y, "fonts/loaded.ttf", W * 0.08)
    creditTextG:setFillColor(unpack(colorTable.green))
    creditTextB = display.newText(creditTextR.text, creditTextR.x, creditButtonR.y + sizeRatio, "fonts/loaded.ttf", W * 0.08)
    creditTextB:setFillColor(unpack(colorTable.blue))
    creditTextB.alpha = 1

    creditGroup:insert(creditButtonB)
    creditGroup:insert(creditButtonG)
    creditGroup:insert(creditButtonR)
    creditGroup:insert(creditTextR)
    creditGroup:insert(creditTextG)
    creditGroup:insert(creditTextB)

    menuGroup:insert(logoGroup)
    menuGroup:insert(playGroup)
    menuGroup:insert(storeGroup)
    menuGroup:insert(instructGroup)
    menuGroup:insert(creditGroup)
end

function scene:show(event)
    local phase = event.phase

    if phase == "will" then
        animateTimer = timer.performWithDelay(15, animateFunction, -1)
    elseif phase == "did" then
        menuStatus = 0

        playButtonR:addEventListener("touch", onPlayClick)
        storeButtonR:addEventListener("touch", onStoreClick)
        instructButtonR:addEventListener("touch", onTutClick)
        creditButtonR:addEventListener("touch", onCreditClick)
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
