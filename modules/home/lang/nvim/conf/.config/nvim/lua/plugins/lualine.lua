return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
		opts = {
			sections = {
				lualine_c = { 'filename', {
					function()
						return require('lsp_signature').status_line(30).hint
					end,
				} },
			},
		}
	},
	{
		'ray-x/lsp_signature.nvim',
		opts = {
			floating_window = false,
			hint_enable = false,
		},
	}
}