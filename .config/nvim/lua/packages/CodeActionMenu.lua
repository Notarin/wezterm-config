return {
	{
		"weilbith/nvim-code-action-menu",
		cmd = { 'CodeActionMenu' }
	},
	{
		"kosayoda/nvim-lightbulb",
		dependencies = { "antoinemadec/FixCursorHold.nvim" },
		opts = {
			autocmd = { enabled = true }
		}
	},
}
