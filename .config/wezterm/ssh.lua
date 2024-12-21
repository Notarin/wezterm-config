local wezterm = require 'wezterm'

return function(config)
    config.ssh_domains = {
        {
            name = 'localhost',
            remote_address = '127.0.0.1',
            username = 'notarin',
        },
    }
end