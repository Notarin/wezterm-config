return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
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
							['<Tab>'] = cmp.mapping.confirm({ select = false }),
							['<Down>'] = cmp.mapping.select_next_item(),
							['<Up>'] = cmp.mapping.select_prev_item(),
							['<Esc>'] = cmp.mapping.abort(),
						}
					})
				end,
			},
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" }
		},
		config = function()
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(
				function(_, bufnr)
					lsp_zero.default_keymaps({ buffer = bufnr })
					lsp_zero.buffer_autoformat()
				end
			)

			local lsp = require('lspconfig')
			local on_attach = function(client)
				require 'completion'.on_attach(client)
			end
			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					rust_analyzer = function()
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
				}
			})
		end,
	},
	{
		'onsails/lspkind.nvim',
	},
}
