local composer = require("composer")
local scene = composer.newScene()

local gameGroup
local gameStatus
local currentScore
local currentPower
local currentSpeed

local obstacleGroup

local playerGroup
local playerR
local playerG
local playerB

local scoreGroup
local scoreR
local scoreG
local scoreB

local pauseGroup
local pauseR
local pauseG
local pauseB

function scene:create(event)
    local gameGroup = self.view

    --== Startup Game and Variables ==--
    gameStatus = 0
    currentScore = 0
    currentPower = "none"
    currentSpeed = 30

    physics.start()
    physics.setGravity(0, 9.8)
    physics.setTimeStep(1/currentSpeed)

    --== Create Obstacle Group ==--
    obstacleGroup = display.newGroup()

    --== Create Player Rect ==--
    playerGroup = display.newGroup()

    playerR = display.newRect(W * 0.5, H * 0.5, W * 0.11, W * 0.11)
    playerR:setFillColor(0.1, 0.1, 0.1)
    playerR.strokeWidth = H * 0.005
    playerR:setStrokeColor(1, 0, 0)
    playerG = display.newRect(playerR.x, playerR.y, playerR.width, playerR.height)
    playerG:setFillColor(0, 0, 0, 0)
    playerG.strokeWidth = H * 0.01
    playerG:setStrokeColor(0, 1, 0)
    playerB = display.newRect(playerR.x, playerR.y, playerR.width, playerR.height)
    playerB:setFillColor(0, 0, 0, 0)
    playerB.strokeWidth = H * 0.02
    playerB:setStrokeColor(0, 0, 1)

    playerGroup:insert(playerB)
    playerGroup:insert(playerG)
    playerGroup:insert(playerR)

    --== Create Score Group ==--
    scoreGroup = display.newGroup()
    scoreGroup.anchorChildren = true
    scoreGroup.x, scoreGroup.y = W * 0.5, H * 0.075

    scoreR = display.newText(currentScore, W * 0.5, H * 0.5, "fonts/BlackOpsOne-Regular.ttf", W * 0.2)
    scoreR:setFillColor(1, 0, 0)
    scoreG = display.newText(currentScore, W * 0.5, scoreR.y + (H * 0.005), "fonts/BlackOpsOne-Regular.ttf", W * 0.2)
    scoreG:setFillColor(0, 1, 0)
    scoreB = display.newText(currentScore, W * 0.5, scoreG.y + (H * 0.005), "fonts/BlackOpsOne-Regular.ttf", W * 0.2)
    scoreB:setFillColor(0, 0, 1)

    scoreGroup:insert(scoreR)
    scoreGroup:insert(scoreG)
    scoreGroup:insert(scoreB)

    --== Create Pause Group ==--
    pauseGroup = display.newGroup()
    pauseGroup.anchorChildren = true
    pauseGroup.x, pauseGroup.y = W * 0.91, W * 0.09

   	pauseR = display.newRect(W * 0.5, H * 0.5, W * 0.1, W * 0.1)
   	pauseR:setFillColor(0.1, 0.1, 0.1)
   	pauseR.strokeWidth = H * 0.004
   	pauseR:setStrokeColor( 1, 0, 0 )
   	pauseG = display.newRect(pauseR.x, pauseR.y, pauseR.width, pauseR.height)
   	pauseG:setFillColor( 0, 0, 0, 0 )
   	pauseG.strokeWidth = pauseR.strokeWidth * 2
   	pauseG:setStrokeColor( 0, 1, 0 )
   	pauseB = display.newRect(pauseR.x, pauseR.y, pauseR.width, pauseR.height)
   	pauseB:setFillColor( 0, 0, 0, 0 )
   	pauseB.strokeWidth = pauseG.strokeWidth * 2
   	pauseB:setStrokeColor( 0, 0, 1 )

   	pauseGroup:insert(pauseB)
   	pauseGroup:insert(pauseG)
   	pauseGroup:insert(pauseR)

    gameGroup:insert(obstacleGroup)
    gameGroup:insert(playerGroup)
    gameGroup:insert(scoreGroup)
    gameGroup:insert(pauseGroup)
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