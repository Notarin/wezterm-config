return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		opts = {
			extensions = {
				file_browser = {
					hijack_netrw = true
				}
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			}
		},
		init = function()
			require('telescope').load_extension "file_browser"
			require('telescope').load_extension "session-lens"
			require("telescope").load_extension "refactoring"
		end,
	},
}
