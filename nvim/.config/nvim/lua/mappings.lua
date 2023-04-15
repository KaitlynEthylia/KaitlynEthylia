function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '

map('n', '<leader>y', "\"+y")
map('v', '<leader>y', "\"+y")
map('n', '<leader>p', "\"+p")
map('v', '<leader>p', "\"+p")
map('i', '<C-Enter>', '<Esc>o')
