local awful = require("awful")
local tag_name = "Music"


awful.tag.add(tag_name, {
    icon               = "",
    index              = 12,
    layouts            = awful.layout.suit.tile,
    layout             = awful.layout.suit.tile
})


awful.keyboard.append_global_keybindings({
  -- ncmpcpp
  awful.key(
    {modkey, },
    'm',
    function()
        local current_tag = awful.screen.focused().selected_tag
        local target_tag = awful.tag.find_by_name(awful.screen.focused(), tag_name)

        -- if not on mpc tag
        if current_tag ~= target_tag then
            -- switch to mpc tag
            target_tag:view_only()

            -- sets c to clients on mpc tag
            local c = target_tag:clients()

            -- if there are no clients on mpc tag
            if c[1] == nil then
                -- spawn a terminal with mpc
                awful.spawn(terminal .. " -e ncmpcpp", 
                {tag = tag_name,})
            end
        -- else (if on mpc tag)
        else
            -- restore previous tag
            awful.tag.history.restore()
        end

    end,

    {description = "toggle ncmpcpp tag", group = "hot tags",}
),

})