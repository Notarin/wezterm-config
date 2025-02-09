local wezterm = require 'wezterm'

return function(config)
    local rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
    rose_pine.selection_bg = '#6e6a86'
    rose_pine.tab_bar = {
        background = '#191724',
        active_tab = {
          bg_color = '#324',
          fg_color = '#fff',
          intensity = 'Bold',
        },
        inactive_tab = {
          bg_color = '#213',
          fg_color = '#888',
        },
    }
    config.colors = rose_pine
end