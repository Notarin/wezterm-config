return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"zbirenbaum/copilot-cmp",
		config = function()
			require('copilot_cmp').setup()
		end
	},
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },

	},
}
