local wezterm = require 'wezterm'

function prime_config()
	return wezterm.config_builder()
end

function main()
	local config = prime_config()
	require('font')(config)
	require('theme')(config)
	require('env')(config)
	require('decorations')(config)
	require('options')(config)
	require('keybinds')(config)
	require('ssh')(config)
	return config
end

return main()
