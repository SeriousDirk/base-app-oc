local GUI = require("GUI")
local component = require('component')

local windows = {
  ["lightWindow"]: GUI.panel(10, 10, application.width - 20, application.height - 20, 0xf0dd0a),
}
local current = ""
local application = GUI.application()
application:addChild(GUI.panel(1, 1, application.width, application.height, 0x2D2D2D))


local menu = application:addChild(GUI.menu(1, 1, application.width, 0xEEEEEE, 0x666666, 0x3366CC, 0xFFFFFF))

local actionButtonsRegular = menu:addChild(GUI.actionButtons(3, 2, false))

actionButtonsRegular.close.onTouch = function()
	application:stop()
end

menu:addItem("Base Control", 0x0).onTouch = function()
	GUI.alert("Hello world!")
end

local lightWindow
local light = menu:addItem("Освещение")
light.onTouch = function()
	if current == "Освещение" then
		return
	end
	showLightWindow()
end


function showLightWindow()
	current = "Освещение"
	lightWindow = application:addChild(windows["lightWindow"])
	local switch = 1
	for address, componentType in component.list("redstone") do
		lightWindow:addChild(GUI.label(3, 2 + (2 * switch), 8, 5, 0xFFFFFF, tostring(switch)))
		lightWindow:addChild(GUI.switch(5, 2+ (2 * switch), 8, 0x66DB80, 0x1D1D1D, 0xEEEEEE, false))
	end
end

function componentRedstoneTable()
	local redstone
	local n = 1
	for address, componentType in component.list() do 
		if componentType == "redstone" then
			while redstone[n] == nil do
				n = n + 1
			end;
			redstone[n] = address
		end
	end
	
	return redstone
end

-- contextMenu:addItem("New")
-- contextMenu:addItem("Open").onTouch = function()
-- 	GUI.alert("Open item was pressed")
-- end
-- contextMenu:addSeparator()
-- contextMenu:addItem("Save")
-- contextMenu:addItem("Save as")
-- -- Add whatever you want
-- menu:addItem("Edit")
-- menu:addItem("View")
-- menu:addItem("About")

application:draw(true)
application:start()