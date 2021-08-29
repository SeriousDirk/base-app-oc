-- Import this library
local GUI = require("GUI")
-- We will also need downloaded double buffering library to render rectangles
local buffer = require("doubleBuffering")

--------------------------------------------------------------------------------

-- Create new application
local application = GUI.application()

-- Create and add template object to application
local object = application:addChild(GUI.object(3, 2, 10, 50))
-- Create own :draw() method and make it render green rectangle
object.draw = function(object)
  buffer.drawRectangle(object.x, object.y, object.width, object.height, 0x919191, 0x0, " ")
end

--------------------------------------------------------------------------------

-- Draw application content once on screen when program starts
application:draw(true)
-- Start processing events for application
application:start()

