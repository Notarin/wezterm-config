local wezterm = require 'wezterm'

return function(config)
    config.window_decorations = "NONE"
    config.enable_tab_bar = true
    config.use_fancy_tab_bar = false
    config.hide_tab_bar_if_only_one_tab = true
    config.show_close_tab_button_in_tabs = false
    config.show_tab_index_in_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false
    config.window_background_opacity = 1.0
    config.window_padding = {
        left = '0cell',
        right = '0cell',
        top = '0cell',
        bottom = '0cell',
    }
    config.window_frame = {
        font = wezterm.font { family = 'Firacode Nerd Font', weight = 'Bold' },
        font_size = 12.0,
    }
end
