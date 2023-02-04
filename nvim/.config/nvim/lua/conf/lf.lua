local vim = vim

vim.g.lf_map_keys = 0

vim.g.lf_width = 0.9
vim.g.lf_height = 0.9

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>l', ':Lf<CR>')

vim.keymap.set('', '<leader>t', ':FloatermToggle<CR>')
vim.keymap.set('', '<leader>c', ':FloatermNew<CR>')
