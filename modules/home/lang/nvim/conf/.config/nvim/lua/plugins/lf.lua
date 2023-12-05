return {
	{
		'lmburns/lf.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'akinsho/toggleterm.nvim'
		},
		config = function()
			vim.g.lf_netrw = 1
			require('lf').setup {
				default_actions = {},
				border = 'rounded',
			}
		end,
		keys = { {
			'<leader>l',
			'<CMD>Lf<CR>',
			{ desc = "Open LF file manager" },
		} },
		cmd = 'Lf',
	},
}
