return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				config = function()
					local lsp = require 'lspconfig'
					local on_attach = function(client)
						require 'completion'.on_attach(client)
					end
					lsp.rust_analyzer.setup({
						on_attach = on_attach,
						settings = {
							["rust-analyzer"] = {
								imports = {
									granularity = {
										group = "module",
									},
									prefix = "self",
								},
								cargo = {
									buildScripts = {
										enable = true,
									},
								},
								procMacro = {
									enable = true
								},
							}
						}
					})
				end,
			},
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"hrsh7th/nvim-cmp",
				config = function()
					local cmp = require('cmp')
					cmp.setup({
						sources = {
							{ name = "copilot" },
							{ name = 'nvim_lsp' },
						},
						snippet = {
							expand = function(args)
								require('luasnip').lsp_expand(args.body)
							end,
						},
						window = {
							documentation = {
								max_height = 15,
								max_width = 60,
							}
						},
						formatting = {
							fields = { 'abbr', 'menu', 'kind' },
							format = function(entry, item)
								local short_name = {
									nvim_lsp = 'LSP',
									nvim_lua = 'nvim'
								}
								local menu_name = short_name[entry.source.name] or
								    entry.source.name
								item.menu = string.format('[%s]', menu_name)
								return item
							end,
						},
						mapping = {
							['<CR>'] = cmp.mapping.confirm({ select = false }),
							['<Right>'] = cmp.mapping.confirm({ select = false }),
							['<Tab>'] = cmp.mapping.confirm({ select = false })
							-- ['<esc>'] = cmp.mapping.abort(),
						}
					})
					local cmp_select = { behavior = cmp.SelectBehavior.Select }
				end,
			},
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" }
		},
		config = function()
			local lsp = require('lsp-zero')
			lsp.preset('recommended')
			lsp.setup()
			lsp.on_attach(
				function(_, bufnr)
					lsp.default_keymaps({ buffer = bufnr })
					lsp.buffer_autoformat()
				end
			)
		end,
	},
}
