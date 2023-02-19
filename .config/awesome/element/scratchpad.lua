-- import awesome lib
local awful = require("awful")
-- local naughty = require("naughty")

-- tag vars
local tag_index = 21
local tag_name = tostring(tag_index)
local t_target

-- creates a *hidden* tag 
-- *it is not source by the taglist, therefore hidden
awful.tag.add(tag_name, {index = tag_index,})
-- assigns the hiddden tag to t_target
t_target = awful.tag.find_by_name(awful.screen.focused(), tag_name)

-- client vars
local client_id = "hidden01"
local c_target

-- var to avoid starting two clients
local off_spawn_cd = true

-- -- defines procedures
local scratchpad_connect_signal_for_cleanup = function()
    if c_target then
        -- when c_target is killed
        c_target:connect_signal("request::unmanage", function ()
            -- empties the object
            c_target = nil
        end)
    end
end

local scratchpad_search_global = function()
    -- walks each client of every screen
    for _, c in ipairs( client.get() ) do
        -- if id matches (i.e. it is a scratchpad)
        if c.single_instance_id == client_id then 
            -- moves to hidden tag
            c:move_to_tag(t_target)
            -- assigns to c_target
            c_target = c
            -- connects to kill signal
            scratchpad_connect_signal_for_cleanup()
            break
        end -- if
    end -- for 
end -- function 

local scratchpad_spawn = function()
    awful.spawn.single_instance(_G.terminal, 
        {
            tag = tag_name,
            sticky = true,
            floating = true,
            ontop = true,
            skip_taskbar = true,

            x = 100,
            y = 100,
            height = 1000,
            width = 1000,

            callback = function()
                -- when spawned, initiates scratchpad
                scratchpad_search_global()
                -- hotkey will have effect again
                off_spawn_cd = true
            end,
        },
        nil, client_id, nil)
end

-- run at awesome startup
awesome.connect_signal("startup", function()
    -- searches for existing c_target
    scratchpad_search_global()
    -- hides c_target so no annoying popup
    if c_target then
        c_target.hidden = true
    end
end)

awful.keyboard.append_global_keybindings({
    awful.key(
        {modkey, },
        's',
        -- _,
        function()
            if off_spawn_cd then
                
                -- if there is no existing client
                -- i.e. none found at startup
                -- or variable reset after kill signal
                if not c_target then 
                    -- spawns a new pad
                    off_spawn_cd = false
                    scratchpad_spawn()
                -- elseif scratchpad is not in focus
                elseif client.focus ~= c_target then
                    client.focus = c_target
                    client.focus.ontop = true
                -- else (if scratchpad is in focus)
                else
                    client.focus.hidden = true
                end
            end
        end,
        {description = "toggle scratchpad", group = "Floater",}
    ),

})