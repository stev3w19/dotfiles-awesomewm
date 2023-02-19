local awful = require("awful")
-- steven's custom keybinds
awful.keyboard.append_global_keybindings({
    awful.key(
        {}, 
        "XF86AudioMute",      
        function () 
            awful.spawn.with_shell("pamixer -t &") 
        end,
        {description="Toggle mute", group="Media Keys"}
    ),

    awful.key(
        {},
        'XF86AudioRaiseVolume',
        function()
            awful.spawn.with_shell("pamixer -i 5 &")
        end,
        {description = "Raise Volume by 5", group = "Media Keys"}
    ),

    awful.key(
        {},
        'XF86AudioLowerVolume',
        function()
            awful.spawn.with_shell("pamixer -d 5 &")
        end,
        {description = "Lower Volume by 5", group = "Media Keys"}
    ),

    awful.key(
        {},
        'XF86MonBrightnessUp',
        function()
            awful.spawn.with_shell("brillo -e -q -A 10 &")
        end,
        {description = "Increase brightness by 10", group = "Media Keys"}
    ),

    awful.key(
        {},
        'XF86MonBrightnessDown',
        function()
            awful.spawn.with_shell("brillo -e -q -U 8 &")
        end,
        {description = "Decrease brightness by 8", group = "Media Keys"}
    ),
})
