W = display.viewableContentWidth
H = display.viewableContentHeight

local composer = require("composer")
local physics = require("physics")
local json = require("json")
local io = require("io")

local function dataManagement(operation)
	local dataFile

	if operation == "read" then

	elseif operation == "write" then

	end
end

composer.gotoScene("scenes.normal", {time=250, effect="fade", params={lastScene="main", dataFunction=dataManagement}})