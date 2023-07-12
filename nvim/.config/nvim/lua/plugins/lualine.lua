return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('lualine').setup {
				sections = {
					lualine_c = { 'filename', {
						function()
							return require('lsp_signature').status_line(30).hint
						end,
					} },
				},
			}
		end,
	},
	{
		'ray-x/lsp_signature.nvim',
		config = function()
			require('lsp_signature').setup {
				floating_window = false,
				hint_enable = false,
			}
		end
	}
}
