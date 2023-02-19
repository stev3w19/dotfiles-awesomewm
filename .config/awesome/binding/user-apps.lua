local awful = require("awful")
-- steven's custom keybinds
awful.keyboard.append_global_keybindings({

    -- rofi 
    awful.key(
        {"Mod1",},
        'space',
        function()
            awful.spawn.with_shell("rofi -show drun")
        end,
        {description = "Launch rofi", group = "steven's apps",}
    ),

    awful.key(
        {modkey,},
        'e',
        function()
            awful.spawn("pcmanfm")
        end,
        {description = "Launch pcmanfm", group = "steven's apps",}
    ),
  

})
