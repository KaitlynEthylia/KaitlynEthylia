require('nvim-treesitter.configs').setup {
	ensure_installed = { 'c', 'lua', 'vim', 'help', 'rust', 'kotlin'},

	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
