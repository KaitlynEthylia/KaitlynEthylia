require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = {
		'sumneko_lua',
		'rust_analyzer',
	}
})

local lsp_attach = function(client, bufnr)
	local opt = { buffer = bufnr, remap = false }

	vim.g.mapleader = ' '
	vim.keymap.set('n', 'gd', function () vim.lsp.buf.definition() end, opt)
	vim.keymap.set('n', '<leader>s', function () vim.lsp.buf.hover() end, opt)
	vim.keymap.set('n', '<leader>r', function () vim.lsp.buf.rename() end, opt)
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = lsp_attach,
		})
	end
})
