local GUI = require("GUI")

--------------------------------------------------------------------------------

local application = GUI.application()
application:addChild(GUI.panel(1, 1, application.width, application.height, 0x2D2D2D))

-- Add menu object to application
local menu = application:addChild(GUI.menu(1, 1, application.width, 0xEEEEEE, 0x666666, 0x3366CC, 0xFFFFFF))
-- Add first item with black color. Attack a callback-function to it
menu:addItem("Base Control", 0x0).onTouch = function()
	GUI.alert("Hello world!")
end

local actionButtonsRegular = application:addChild(GUI.actionButtons(application.width - 10, 2, false))

actionButtonsRegular.close.onTouch = function()
  application.close()
end
-- Add context menu and few items to it
local light = menu:addItem("Освещение")

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

--------------------------------------------------------------------------------

application:draw(true)
application:start()