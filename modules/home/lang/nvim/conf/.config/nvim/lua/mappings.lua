function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

vim.g.mapleader = ' '

map({ 'n', 'v' }, '<leader>y', "\"+y")
map({ 'n', 'v' }, '<leader>p', "\"+p")
map('i', '<C-Enter>', '<Esc>o')

map({ 'n', 'v' }, '<C-x> o', "<C-w>w")

vim.api.nvim_create_autocmd('LspAttach', {
		callback = function()
				map('n', '<leader>s', vim.lsp.buf.hover)
				map('n', '<leader>r', vim.lsp.buf.rename)
				map('n', '<leader>a', vim.lsp.buf.code_action)

				map('n', '<leader>gd', vim.lsp.buf.definition)
				map('n', '<leader>gi', vim.lsp.buf.implementation)

				vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = 0,
						callback = function() vim.lsp.buf.format() end
				})
		end
})
