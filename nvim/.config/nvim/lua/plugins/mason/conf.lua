require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"kotlin_language_server"
	},
}

require('mason-lspconfig').setup_handlers {
	function(lsp)
		require('lspconfig')[lsp].setup({
			on_attach = OnAttach,
			settings = Settings,
		})
	end
}

