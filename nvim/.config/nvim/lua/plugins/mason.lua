return {
	{
		'williamboman/mason.nvim',
		config = function() require('mason').setup() end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig',
		},
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
				},
			}

			require('mason-lspconfig').setup_handlers {
				function(lsp)
					require('lspconfig')[lsp].setup {
						on_attach = function()
							map('n', '<leader>s', vim.lsp.buf.hover)
							map('n', '<leader>r', vim.lsp.buf.rename)
							map('n', '<leader>a', vim.lsp.buf.code_action)

							map('n', '<leader>gd', vim.lsp.buf.definition)
							map('n', '<leader>gi', vim.lsp.buf.implementation)

							vim.api.nvim_create_autocmd('BufWritePre', {
								buffer = 0,
								callback = function() vim.lsp.buf.format() end
							})
						end,
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false
								},
							}
						}
					}
				end
			}
		end,
	},
}
