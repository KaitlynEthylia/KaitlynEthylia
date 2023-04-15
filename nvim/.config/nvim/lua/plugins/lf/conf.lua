vim.g.lf_netrw = 1

require('lf').setup {
	default_actions = {},
	height = 0.9,
	width = 0.9,
	border = 'rounded',
}

map('n', '<leader>l', ':Lf<CR>')
map('n', '<leader>c', ':Lf ~/.config/nvim/lua<CR>')
