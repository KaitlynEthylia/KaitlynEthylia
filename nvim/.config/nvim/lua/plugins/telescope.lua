return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			local telescopeConfig = require('telescope.config')
			local telescope = require('telescope')

			local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
			table.insert(vimgrep_arguments, '--hidden')
			table.insert(vimgrep_arguments, '--glob')
			table.insert(vimgrep_arguments, '!**/.git/*')
			table.insert(vimgrep_arguments, '-L')

			telescope.setup {
				defaults = {
					vimgrep_arguments = vimgrep_arguments,
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "-L" },
					},
				},
			}
		end,
		cmd = 'Telescope',
		keys = {
			{ '<leader>ff', '<CMD>Telescope find_files<CR>' },
			{ '<leader>fg', '<CMD>Telescope live_grep<CR>' },
			{ '<leader>fb', '<CMD>Telescope buffers<CR>' },
			{ '<leader>fh', '<CMD>Telescope help_tags<CR>' },
			{ '<leader>fr', '<CMD>Telescope lsp_references<CR>' },
		},
	},
}
