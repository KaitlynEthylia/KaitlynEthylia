return {
	{ 'catppuccin/nvim',          name = 'catppuccin' },
	{ 'theprimeagen/vim-be-good', cmd = 'VimBeGood' },
	{ 'andweeb/presence.nvim',    init = function() require('presence').setup() end },
	'lilydjwg/colorizer',
	'neovim/nvim-lspconfig',
}