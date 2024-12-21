local wezterm = require 'wezterm'

local function config(config)
    config.unix_domains = {
        {
            name = 'default',
        },
    }
    config.default_gui_startup_args = { 'connect', 'default' }
end

return config