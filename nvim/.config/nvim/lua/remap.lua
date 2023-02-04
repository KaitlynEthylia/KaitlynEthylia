local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '

map('n', '<leader>f', vim.cmd.FZF)

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>y', "\"+y")
map('v', '<leader>y', "\"+y")
map('n', '<leader>p', "\"+p")
map('v', '<leader>p', "\"+p")
