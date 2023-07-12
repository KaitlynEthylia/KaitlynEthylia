return {
	{
		"m4xshen/hardtime.nvim",
		opts = {
			disabled_keys = {},
		},
	},
	{
		'folke/which-key.nvim',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		cmd = 'WhichKey',
	},
	{
		'folke/neodev.nvim',
		init = function() require('neodev').setup() end,
		ft = 'lua',
	},
	{
		'KaitlynEthylia/Evalua',
		cmd = 'Evalua',
		keys = { {
			"<C-x><C-e>",
			"<CMD>Evalua<CR>",
			desc = "Evaluate lua expression under cursor"
		} },
	},
	'nvim-treesitter/playground',
}
