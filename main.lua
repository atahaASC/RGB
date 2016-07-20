W = display.viewableContentWidth
H = display.viewableContentHeight

display.setStatusBar( display.HiddenStatusBar )

local composer = require("composer")
local physics = require("physics")
local json = require("json")
local io = require("io")

composer.setVariable("ratio", H * 0.006)
composer.setVariable("colorValue", "rgb")

local function dataManagement(operation)
	local dataFile

	if operation == "read" then

	elseif operation == "write" then

	end
end

composer.gotoScene("scenes.mainmenu", {time=250, effect="fade", params={lastScene="main", dataFunction=dataManagement}})
