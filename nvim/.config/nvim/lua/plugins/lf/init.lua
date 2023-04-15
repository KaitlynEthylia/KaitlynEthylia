return {
	{
		'lmburns/lf.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'akinsho/toggleterm.nvim'
		},
		config = function() require('plugins.lf.conf') end,
		lazy = false,
	},
}
