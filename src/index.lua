-- Import this library
local GUI = require("GUI")
-- We will also need downloaded double buffering library to render rectangles
local buffer = require("doubleBuffering")

--------------------------------------------------------------------------------

-- Create new application
local application = GUI.application()

-- Create and add template object to application
local bar = application:addChild(GUI.object(3, 2, 10, 50))
-- Create own :draw() method and make it render green rectangle
bar.draw = function(bar)
  buffer.drawRectangle(bar.x, bar.y, bar.width, bar.height, 0x919191, 0x0, " ")
end


local light = bar:addChild(GUI.object(3, 2, 5, 5))

light.draw = function(light)
  buffer.drawRectangle(light.x, light.y, light.width, light.height, 0xf5e342, 0x0, " ")
end 
--------------------------------------------------------------------------------

-- Draw application content once on screen when program starts
application:draw(true)
-- Start processing events for application
application:start()

