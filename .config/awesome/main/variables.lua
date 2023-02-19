-- This is used later as the default terminal and editor to run.
_G.terminal = "kitty"
_G.home = os.getenv("HOME")
_G.editor = os.getenv("EDITOR") or "nvim"
_G.editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
_G.modkey = "Mod4"



-- indexed for other components
_G.main_screen = 1


-- steven's fav fonts
_G.font1 = "JetBrainsMono Nerd Font Mono, Bold 11"
