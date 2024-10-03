return {
	{
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v4.x',
	  lazy = true,
	  config = false,
	},
	{
	  'williamboman/mason.nvim',
	  lazy = false,
	  config = true,
	},
  
	-- Autocompletion
	{
	  'hrsh7th/nvim-cmp',
	  event = 'InsertEnter',
	  dependencies = {
		{'L3MON4D3/LuaSnip'},
	  },
	  config = function()
		local cmp = require('cmp')
  
		cmp.setup({
		  sources = {
			{name = 'nvim_lsp'},
		  },
		  mapping = cmp.mapping.preset.insert({
			['<Enter>'] = cmp.mapping.confirm({ select = true }),
		  }),
				  snippet = {
					  expand = function(args)
						  require('luasnip').lsp_expand(args.body)
					  end,
				  },
				  window = {
					  documentation = {
						  max_height = 15,
						  max_width = 60,
					  },
				  },
				  formatting = {
					  fields = { 'abbr', 'menu', 'kind' },
					  format = function(entry, item)
						  local short_name = {
							  nvim_lsp = 'LSP',
							  nvim_lua = 'nvim',
						  }
						  local menu_name = short_name[entry.source.name] or
							  entry.source.name
						  item.menu = string.format('[%s]', menu_name)
						  return item
					  end,
				  },
		})
	  end
	},
  
	-- LSP
	{
	  'neovim/nvim-lspconfig',
	  cmd = {'LspInfo', 'LspInstall', 'LspStart'},
	  event = {'BufReadPre', 'BufNewFile'},
	  dependencies = {
		{'hrsh7th/cmp-nvim-lsp'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
	  },
	  config = function()
		local lsp_zero = require('lsp-zero')
  
		lsp_zero.extend_lspconfig({
		  sign_text = true,
		  lsp_attach = lsp_attach,
		  capabilities = require('cmp_nvim_lsp').default_capabilities()
		})
  
		require('mason-lspconfig').setup({
		  ensure_installed = {"rust-analyzer"},
		  handlers = {
			-- this first function is the "default handler"
			-- it applies to every language server without a "custom handler"
			function(server_name)
			  require('lspconfig')[server_name].setup({})
			end,
			require('lspconfig').rust_analyzer.setup({
			  settings = {
				["rust-analyzer"] = {
				  checkOnSave = {
					command = "clippy"
				  },
				  imports = {
					granularity = {
					  group = "module"
					},
					prefix = "self"
				  },
				  cargo = {
					buildScripts = {
					  enable = true
					}
				  },
				  procMacro = {
					enable = true
				  }
				}
			  }
			}),
		  }
		})
  
					-- Automatically format the buffer on save
			  vim.api.nvim_create_autocmd("BufWritePre", {
				  buffer = buffer,
				  callback = function()
					  vim.lsp.buf.format { async = false }
				  end
			  })
	  end
	}
  }