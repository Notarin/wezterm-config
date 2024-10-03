return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"tiagovla/scope.nvim",
		},
		event = "ColorScheme",
		config = function()
			local highlights = require('rose-pine.plugins.bufferline')
			require('bufferline').setup({
				highlights = highlights,
				options = {
					mode = 'tabs',
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					color_icons = true,
					hover = {
						enabled = true,
						delay = 100,
						reveal = {
							'close',
						},
					},
					diagnostics_indicator = function(_, _, diagnostics_dict, _)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and " "
							    or (e == "warning" and " " or "")
							s = s .. n .. sym
						end
						return s
					end,
				},
			})
		end,
	},
	{
		"tiagovla/scope.nvim",
	},
}
