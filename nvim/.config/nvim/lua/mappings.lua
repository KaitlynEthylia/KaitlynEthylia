function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '

map({'n', 'v'}, '<leader>y', "\"+y")
map({'n', 'v'}, '<leader>p', "\"+p")
map('i', '<C-Enter>', '<Esc>o')
