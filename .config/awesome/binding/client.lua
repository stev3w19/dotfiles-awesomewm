awful = require("awful")

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey,           }, 
        "h",
        function ()
            awful.client.focus.global_bydirection("left", client.focus)
        end,
        {description = "focus left", group = "client"}
    ),

    awful.key(
        { modkey,           }, 
        "j",
        function ()
            awful.client.focus.global_bydirection("down", client.focus)
        end,
        {description = "focus down", group = "client"}
    ),

    awful.key(
        { modkey,           }, 
        "k",
        function ()
            awful.client.focus.global_bydirection("up", client.focus)
        end,
        {description = "focus up", group = "client"}
    ),

    awful.key(
        { modkey,           }, 
        "l",
        function ()
            awful.client.focus.global_bydirection("right", client.focus)
        end,
        {description = "focus right", group = "client"}
    ),

    awful.key({ "Mod1" }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back to last focused client", group = "client"}
    ),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}
            ),

    -- screen focus - consider moving
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( -1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-3) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- swapping clients
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.global_bydirection("left")    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.global_bydirection("down")    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.global_bydirection("up")    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.global_bydirection("right")    end,
              {description = "swap with next client by index", group = "client"}),

})

-- mouse click, drag, and resize
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button(
            { modkey }, 
            1, 
            function (c)
                c:activate { 
                    context = "mouse_click", 
                action = "mouse_move"  }

            end
        ),

        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey,    }, "q",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)