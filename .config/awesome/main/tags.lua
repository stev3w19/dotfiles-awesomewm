local awful = require("awful")
local l = awful.layout.suit  -- Just to save some typing: use an alias.

-- common tags
-- CONNECT THIS TO SCREEN SIGNAL?
local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9"}
local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile, l.tile, 
                l.tile, l.tile, l.tile, l.tile}
awful.tag(names, s, layouts)
