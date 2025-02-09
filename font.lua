local wezterm = require 'wezterm'

return function(config)
    config.font = wezterm.font_with_fallback {
        "Firacode Nerd Font",
        "Noto Sans Mono",
        "Symbols Nerd Font Mono",
    }
    
    config.harfbuzz_features = { 'cv12' }
    config.font_size = 12
    config.bold_brightens_ansi_colors = true
end