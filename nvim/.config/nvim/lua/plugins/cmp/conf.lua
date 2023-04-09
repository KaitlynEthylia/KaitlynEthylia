local cmp = require('cmp')
local snippets = require('plugins.snippets.exp')

cmp.setup {
	snippet = snippets.settings,
	mapping = {
		["<C-t>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-r>"] = cmp.mapping.scroll_docs(-1),
		["<C-s>"] = cmp.mapping.scroll_docs(1),
		["<C-Space>"] = cmp.mapping.confirm { select = true },
		["<C-e>"] = cmp.mapping.abort(),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then cmp.select_next_item()
			elseif snippets.engine.expandable() then snippets.engine.expand()
			elseif snippets.engine.expand_or_jumpable() then snippets.engine.expand_or_jump()
			else fallback()
			end
		end, { 'i', 's' }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then cmp.select_prev_item()
			elseif snippets.engine.jumpable(-1) then snippets.engine.jump(-1)
			else fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = snippets.source },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	formatting = {
		fields = {'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", require('plugins.cmp.icons')[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
}

