local wezterm = require 'wezterm'

return function(config)
    local rose_pine = wezterm.color.get_builtin_schemes()['rose-pine']
    rose_pine.selection_bg = '#6e6a86'
    config.colors = rose_pine
end