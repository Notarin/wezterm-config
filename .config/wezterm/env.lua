local wezterm = require 'wezterm'

return function(config)
    config.set_environment_variables = {
        LANG = "en_US.UTF-8",
    }
end