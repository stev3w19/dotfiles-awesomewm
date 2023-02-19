local awful = require("awful")
local gfs = require("gears.filesystem")

local tag_index = 11
local tag_name = tostring(tag_index)
local tag_icon = gfs.get_configuration_dir() .. "assets/browser-tag.svg"


awful.tag.add(tag_name, {
    icon               = tag_icon,
    index              = tag_index,
    layouts            = awful.layout.suit.max,
    layout             = awful.layout.suit.max,
})


awful.keyboard.append_global_keybindings({
  awful.key(

    {modkey, },
    'b',

    function()
        local t_current = awful.screen.focused().selected_tag
        local t_target = awful.tag.find_by_name(awful.screen.focused(), tag_name)
        -- if on target tag
        if t_current == t_target then
            -- restore previous tag
            awful.tag.history.restore()
        -- if not on t_target
        else
            -- switch to target tag
            t_target:view_only()
            -- if there are no clients on target tag
            if not t_target:clients()[1] then
                -- spawn a target app
                awful.spawn("librewolf",
                {tag = tag_name, })
            end
        end
    end,

    {description = "toggle browser tag", group = "hot tags",}
),

})