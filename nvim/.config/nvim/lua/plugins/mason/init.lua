return {
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'nvim-lspconfig',
		},
		config = function() require('plugins.mason.conf') end,
	},
}
