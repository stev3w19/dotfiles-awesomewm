local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")

-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() awful.hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", _G.terminal .. " -e man awesome" },
   { "edit config", _G.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

-- mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
--                                     { "open terminal", terminal }
--                                   }
                        -- })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = _G.terminal 
-- Set the terminal for applications that require it