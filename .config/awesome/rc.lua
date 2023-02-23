pcall(require, "luarocks.loader")

local gfs = require("gears.filesystem")
-- Theme handling library
local beautiful = require("beautiful")
-- local keybind = require("awful.keyboard.append_global_keybindings")


-- debugging libraries
local awful = require("awful")
local ruled = require("ruled")



require("main.variables")

require("main.error-handling")
require("main.layout")
require("main.notifications")
require("main.rules")
require("main.tags")


-- Themes define colours, icons, font and wallpapers.
beautiful.init(gfs.get_configuration_dir() .. "/theme/theme.lua")


require("element.wallpaper")
require("element.menu")
require("element.taskbar")
require("element.titlebar")
require("element.scratchpad")

require("element.music-player-tag")
require("element.browser-tag")



require("binding.core")
require("binding.media")

require("binding.layout")
require("binding.tags")
require("binding.client")
require("binding.user-apps")

-- configure inputs
awful.spawn.with_shell(gfs.get_configuration_dir() .. "input_config.sh")


awful.spawn.with_shell("lxsession &")
