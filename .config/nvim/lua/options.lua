local opt = vim.opt

-- Context
--opt.colorcolumn = '80'     -- wrap guide
opt.number = true          -- show line nums
opt.relativenumber = false -- relative line num
opt.scrolloff = 10         -- lines of context
opt.signcolumn = "yes"     -- show sign column

-- Filetypes
opt.encoding = 'utf8'     -- string encoding
opt.fileencoding = 'utf8' -- file encoding

-- Theming
opt.syntax = "ON"        -- syntax highlighting (obviously)
opt.termguicolors = true -- term ui colors (0-16)

-- Searching
opt.ignorecase = true
opt.smartcase = true -- If capitals are present disable ignorecase
opt.incsearch = true -- incremental search
opt.hlsearch = true  -- higlighting search matches

-- Splits
opt.splitright = true
opt.splitbelow = true

-- line number
opt.relativenumber = true -- relative line numbers
opt.number = true         -- this changes the '0' to the current line number
opt.numberwidth = 4       -- the width allocated to the number column

-- Automatically reload files when they are changed outside of Neovim
vim.api.nvim_set_option('autoread', true)

-- Automatically save changes to files when leaving insert mode
vim.api.nvim_set_option('autowrite', true)

-- Clipboard support
vim.opt.clipboard = "unnamedplus"

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
	virtual_text = false,
})
