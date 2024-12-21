local wezterm = require 'wezterm'

local function config(config)
    config.set_environment_variables = {
        LANG = "en_US.UTF-8",
    }
end

return config