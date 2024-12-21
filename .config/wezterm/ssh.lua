local wezterm = require 'wezterm'

local function config(config)
    config.ssh_domains = {
        {
            name = 'localhost',
            remote_address = '127.0.0.1',
            username = 'notarin',
        },
    }
end

return config