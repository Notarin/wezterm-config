local wezterm = require 'wezterm'

local function config(config)
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
end

return config