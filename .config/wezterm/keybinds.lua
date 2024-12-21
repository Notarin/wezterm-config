local wezterm = require 'wezterm'
local action = wezterm.action

return function(config)
    config.keys = {
        {
            mods = "CTRL",
            key = "c",
            action = wezterm.action_callback(function(window, pane)
                local has_selection = window:get_selection_text_for_pane(pane) ~= ""
                if has_selection then
                    window:perform_action(
                        action { CopyTo = "ClipboardAndPrimarySelection" },
                        pane)
                    window:perform_action("ClearSelection", pane)
                else
                    window:perform_action(
                        action { SendKey = { key = "c", mods = "CTRL" } },
                        pane)
                end
            end)
        },
        { mods = "CTRL", key = "v",          action = action.PasteFrom 'Clipboard' },
        { mods = 'ALT',  key = 'Enter',      action = action.DisableDefaultAssignment, },
        { mods = 'CTRL', key = 'Enter',      action = action.SendKey { key = '/', mods = "CTRL" }, },
        { mods = "CTRL", key = "t",          action = action.SpawnTab 'CurrentPaneDomain' },
        { mods = "CTRL", key = "w",          action = action.CloseCurrentTab { confirm = false } },
        { mods = 'ALT',  key = 'h',          action = action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { mods = 'ALT',  key = 'v',          action = action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { mods = 'ALT',  key = 'LeftArrow',  action = action.ActivatePaneDirection 'Left', },
        { mods = 'ALT',  key = 'RightArrow', action = action.ActivatePaneDirection 'Right', },
        { mods = 'ALT',  key = 'UpArrow',    action = action.ActivatePaneDirection 'Up', },
        { mods = 'ALT',  key = 'DownArrow',  action = action.ActivatePaneDirection 'Down', },
        { mods = 'ALT',  key = 'w',          action = wezterm.action.CloseCurrentPane { confirm = false }, },
    }
end
