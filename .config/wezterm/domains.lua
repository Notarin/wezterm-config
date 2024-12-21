local wezterm = require 'wezterm'

return function(config)
    config.unix_domains = {
        {
            name = 'default',
        },
    }
    config.default_gui_startup_args = { 'connect', 'default' }
end