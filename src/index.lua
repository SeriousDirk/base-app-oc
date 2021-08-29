local GUI = require("GUI")

--------------------------------------------------------------------------------

-- Create new application
local application = GUI.application()

-- Add panel that fits application
application:addChild(GUI.panel(1, 1, application.width, application.height, 0x262626))
-- Add smaller red panel
application:addChild(GUI.panel(1, (application.width - 20) / 2, application.width - 20, application.height - 40, 0x007a88))

--------------------------------------------------------------------------------

application:draw(true)
application:start()