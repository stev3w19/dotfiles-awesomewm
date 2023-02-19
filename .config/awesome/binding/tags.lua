local awful = require("awful")
-- local naughty = require("naughty")

tag_idx_max = 9
tag_idx_min = 1

-- tags 1 to 9, recurse
local view_next = function ()
    local i = awful.screen.focused().selected_tag.index
    i = i + 1
    if i > tag_idx_max then
        i = tag_idx_min
    end
    awful.screen.focused().tags[i]:view_only()
end

local view_prev = function ()
    local i = awful.screen.focused().selected_tag.index
    i = i - 1
    if i < tag_idx_min then
        i = tag_idx_max
    end
    awful.screen.focused().tags[i]:view_only()
end




-- Tags related keybindings
awful.keyboard.append_global_keybindings({

    awful.key({ modkey,           }, "Left", view_prev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right", view_next,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local t = screen.tags[index]
            local t_current = screen.selected_tag
            if t then
                if t == t_current then
                    awful.tag.history.restore() 
                else
                    t:view_only()
                end
            end
        end,
    },

    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },

    awful.key {
        modifiers
         = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },

    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})




-- Mouse bindings
awful.mouse.append_global_mousebindings({
    -- awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, view_prev),
    awful.button({ }, 5, view_next),
})