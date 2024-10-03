local telescope = require('telescope.builtin')
local file_browser = require('telescope').extensions.file_browser
local wk = require("which-key")

local refactor_function = {
	name = "+refactor",
	r = {
		vim.lsp.buf.rename,
		"Rename",
	},
	e = {
		vim.lsp.buf.code_action,
		"Everything else",
	},
	t = {
		function() vim.cmd("lua require('telescope').extensions.refactoring.refactors()") end,
		"Prime refactor",
	}
}

wk.register({
	["<leader>"] = {
		e = { file_browser.file_browser, "File Explorer" },
		w = { "<cmd>bd<cr>", "Close Buffer" },
		s = { "<cmd>w<cr>", "Save File" },
		f = { "<cmd>Telescope frecency<cr>", "Smart Files" },
		b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
		r = refactor_function,
		m = {
			name = "+minimap"
		},
		l = {
			name = "+sessions",
			d = { "<cmd>SessionDelete<cr>", "Delete Session" },
			s = { "<cmd>SessionSave<cr>", "Save Session" },
		},
		t = {
			require('FTerm').open, "Open Terminal"
		}
	},
	["t"] = {
		function()
			local word = vim.fn.expand("<cword>")
			local booleanValues = {
				["true"] = "false",
				["false"] = "true",
				["yes"] = "no",
				["no"] = "yes",
				["on"] = "off",
				["off"] = "on",
				["1"] = "0",
				["0"] = "1"
			}
			if booleanValues[word] then
				local currentLine = vim.fn.getline(".")
				local modifiedLine = string.gsub(currentLine, word, booleanValues[word])
				vim.fn.setline(".", modifiedLine)
			else
				print("This isn't a boolean value, day ruined :(")
			end
		end,
		"Toggle"
	},
}, {
	mode = "n",
})

wk.register(
	{
		["<leader>"] = {
			r = refactor_function,
		},
		["/"] = {
			"<cmd>'<,'>CommentToggle<cr>", "Toggle Comment"
		},
	},
	{
		mode = "v",
	}
)

vim.keymap.set("t", "<esc>", require('FTerm').close)
vim.keymap.set("n", "<A-q>", "<cmd>lua vim.lsp.buf.hover()<cr>")

-- buffer navigation
vim.keymap.set("n", "<A-Left>", "<cmd>bprev<cr>")
vim.keymap.set("n", "<A-Right>", "<cmd>bnext<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>bprev<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>")

-- find occurances of provided string among project files
vim.keymap.set("n", "<C-A-f>", function()
	telescope
	    .grep_string(
		    { search = vim.fn.input("greps your balls :3 ") }
	    );
end)

-- Code actions menus
vim.keymap.set({ "n", "v" }, "<A-Enter>", vim.cmd.CodeActionMenu)
vim.keymap.set({ "n", "v" }, "<A-\'>", "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<cr>")


-- Shift selection
-- Normal mode
vim.api.nvim_set_keymap('n', '<S-Up>', 'v<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', 'v<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Left>', 'v<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Right>', 'v<Right>', { noremap = true, silent = true })

-- Visual mode
vim.api.nvim_set_keymap('v', '<S-Up>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Left>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', '<Right>', { noremap = true, silent = true })

-- Insert mode
vim.api.nvim_set_keymap('i', '<S-Up>', '<Esc>v<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<Esc>v<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Left>', '<Esc>v<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '<Esc>v<Right>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Q', 'q', {})
