local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
rose_pine.selection_bg = '#6e6a86'
config.colors = rose_pine

config.set_environment_variables = {
	LANG = "en_US.UTF-8",
}

config.bold_brightens_ansi_colors = true

--config.underline_thickness = 2

config.enable_tab_bar = false

config.font = wezterm.font_with_fallback {
	"Firacode Nerd Font",
	"Noto Sans Mono",
	"Symbols Nerd Font Mono",
}

config.enable_csi_u_key_encoding = true

config.harfbuzz_features = { 'cv12' }

config.custom_block_glyphs = true

config.font_size = 12

config.window_background_opacity = 1.0

config.enable_wayland = true

config.adjust_window_size_when_changing_font_size = false

config.keys = {
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(
					wezterm.action { CopyTo = "ClipboardAndPrimarySelection" },
					pane)
				window:perform_action("ClearSelection", pane)
			else
				window:perform_action(
					wezterm.action { SendKey = { key = "c", mods = "CTRL" } },
					pane)
			end
		end)
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom 'Clipboard',
	},
	{
		key = 'Enter',
		mods = 'ALT',
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = 'Enter',
		mods = 'CTRL',
		action = wezterm.action.SendKey { key = '/', mods = "CTRL" },
	},
}

config.enable_kitty_graphics = true

config.window_padding = {
	left = '0cell',
	right = '0cell',
	top = '0cell',
	bottom = '0cell',
}

config.window_close_confirmation = "NeverPrompt"

config.ssh_domains = {
	{
		name = 'localhost',
		remote_address = '127.0.0.1',
		username = 'notarin',
	},
}

config.unix_domains = {
	{
		name = 'default',
	},
}

-- This causes `wezterm` to act as though it was started as
-- `wezterm connect unix` by default, connecting to the unix
-- domain on startup.
-- If you prefer to connect manually, leave out this line.
config.default_gui_startup_args = { 'connect', 'default' }


if string.match(os.getenv("SHELL"), 'nu$') then
	config.default_prog = { os.getenv("SHELL"), '-l', '-c \"nu ~/.config/nushell/zellij.nu\"' }
end

return config
