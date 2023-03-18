local luasnip = require('luasnip')

return {
	settings = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	source = 'luasnip',
	engine = luasnip,
}
