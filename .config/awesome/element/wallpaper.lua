local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")



-- Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.spawn.with_shell("nitrogen --restore &")

    -- awful.wallpaper {
    --     screen = s,
    --     widget = {
    --         {
    --             image     = beautiful.wallpaper,
    --             upscale   = true,
    --             downscale = true,
    --             widget    = wibox.widget.imagebox,
    --         },
    --         valign = "center",
    --         halign = "center",
    --         tiled  = false,
    --         widget = wibox.container.tile,
    --     }
    -- }
end)