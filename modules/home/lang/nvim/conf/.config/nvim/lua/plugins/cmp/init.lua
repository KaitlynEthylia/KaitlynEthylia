return {
	{
		'hrsh7th/nvim-cmp',
		config = function() require('plugins.cmp.conf') end,
	},
	{ 'hrsh7th/cmp-buffer',  dependencies = 'nvim-cmp' },
	{ 'hrsh7th/cmp-path',    dependencies = 'nvim-cmp' },
	{ 'hrsh7th/cmp-cmdline', dependencies = 'nvim-cmp' },
	{
		'hrsh7th/cmp-nvim-lsp',
		dependencies = {
			'nvim-cmp',
			'nvim-lspconfig',
		}
	},
	{ 'saadparwaiz1/cmp_luasnip' },
}
