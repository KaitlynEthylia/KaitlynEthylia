local telescope_status, builtin = pcall(require, 'telescope.builtin')

OnAttach = function(_, _)
	map('n', '<leader>s', vim.lsp.buf.hover)
	map('n', '<leader>r', vim.lsp.buf.rename)
	map('n', '<leader>a', vim.lsp.buf.code_action)

	map('n', '<leader>gd', vim.lsp.buf.definition)
	map('n', '<leader>gi', vim.lsp.buf.implementation)
	if telescope_status then
		map('n', '<leader>gr', builtin.lsp_references)
	end

	if CustomOnAttach then for _, v in pairs(CustomOnAttach) do v() end end

	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

Settings = {
	Lua = {
		diagnostics = {
			globals = { 'vim', 'Settings', 'OnAttach', 'CustomOnAttach', 'Transify', 'map' }
		}
	}
}
