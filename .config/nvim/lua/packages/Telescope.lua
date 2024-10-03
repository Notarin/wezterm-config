return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		opts = {
			extensions = {
				file_browser = {
					hijack_netrw = true,
				},
				frecency = {
					default_workspace = 'CWD',
					show_scores = true,
					show_unindexed = true,
					ignore_patterns = { "*.git/*" },
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("telescope").load_extension "frecency"
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("telescope").load_extension "refactoring"
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("telescope").load_extension "file_browser"
		end,
	},
}
