local wezterm = require 'wezterm'

local function config(config)
    config.enable_wayland = true
    config.adjust_window_size_when_changing_font_size = false
    config.enable_kitty_graphics = true
    config.window_close_confirmation = "NeverPrompt"
end

return config