local composer = require("composer")
local scene = composer.newScene()

local gameGroup
local gameStatus
local currentScore
local currentSpeed
local currentPower

local gameBack

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
local pauseButtonR
local pauseButtonG
local pauseButtonB
local pauseTextR
local pauseTextG
local pauseTextB

function scene:create(event)
	local gameGroup = self.view

	gameStatus = 1
	currentScore = 0
	currentSpeed = 0
	currentPower = "none"

	gameBack = display.newRect(W * 0.5, H * 0.5, W, H)
	gameBack:setFillColor(0.1, 0.1, 0.1)

	scoreGroup = display.newGroup()
	scoreGroup.anchorChildren = true
	scoreGroup.x, scoreGroup.y = W * 0.02, H * 0.07
	scoreGroup.anchorX = 0

	scoreR = display.newText(currentScore, W * 0.5, H * 0.5, "fonts/BlackOpsOne-Regular.ttf", W * 0.175)
	scoreR:setFillColor( 1, 0, 0 )
	scoreG = display.newText(scoreR.text, W * 0.5, scoreR.y + (H * 0.005), "fonts/BlackOpsOne-Regular.ttf", W * 0.175)
	scoreG:setFillColor( 0, 1, 0 )
	scoreB = display.newText(scoreR.text, W * 0.5, scoreG.y + (H * 0.005), "fonts/BlackOpsOne-Regular.ttf", W * 0.175)
	scoreB:setFillColor( 0, 0, 1 )

	scoreGroup:insert(scoreR)
	scoreGroup:insert(scoreG)
	scoreGroup:insert(scoreB)

	pauseGroup = display.newGroup()
	pauseGroup.anchorChildren = true
	pauseGroup.x, pauseGroup.y = W * 0.98, H * 0.07
	pauseGroup.anchorX = 1

	pauseButtonR = display.newRoundedRect(W * 0.5, H * 0.5, W * 0.2, W * 0.2, W * 0.025)


	gameGroup:insert(gameBack)
	gameGroup:insert(scoreGroup)
end

function scene:show(event)
	local phase = event.phase

	if phase == "will" then

	elseif phase == "did" then

	end
end

function scene:show(event)
	local phase = event.phase

	if phase == "will" then

	elseif phase == "did" then

	end
end

function scene:destroy(event)

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene