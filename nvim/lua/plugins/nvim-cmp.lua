return {
  "hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
	},
	config = function ()
		local cmp = require'cmp'
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = {
				['<Tab>'] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Insert
				}),
				['<S-Tab>'] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Insert
				}),
				['<Down>'] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Select
				}),
				['<Up>'] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Select
				}),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-e>'] = cmp.mapping.close(),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },
				{ name = 'buffer' },
				{ name = 'nvim_lua' },
			}),
			formatting = {
				format = function(entry, item)
					item.menu = ({
						buffer = 'buf',
						nvim_lsp = 'lsp',
						vsnip = 'vsp',
						nvim_lua = 'lua',
					})[entry.source.name]
					return item
				end
			},
		})
		-- Use buffer source for `/`.
		cmp.setup.cmdline('/', {
			sources = {
				{ name = 'buffer' },
			}
		})
		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(':', {
			sources = cmp.config.sources({
				{ name = 'path' },
			},
			{
				{ name = 'cmdline' },
			})
		})
	end
}
