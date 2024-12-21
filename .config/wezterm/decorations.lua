local wezterm = require 'wezterm'

local function config(config)
    config.enable_tab_bar = false
    config.window_background_opacity = 1.0
    config.window_padding = {
        left = '0cell',
        right = '0cell',
        top = '0cell',
        bottom = '0cell',
    }
end

return config