vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'theprimeagen/vim-be-good'

	use 'kmonad/kmonad-vim'

	use {
		'ptzz/lf.vim',
		as = 'lf',
		requires = 'voldikss/vim-floaterm',
		config = require('conf.lf')
	}

	use {
		'nvim-lualine/lualine.nvim', 
		as = 'lualine',
		requires = 'kyazdani42/nvim-web-devicons',
		config = require('conf.lualine')
	}

	use { 'rose-pine/neovim', as = 'rosepine' }

	use { 'dracula/vim', as = 'dracula' }

	use {
		'nvim-treesitter/nvim-treesitter',
		as = 'treesitter',
		run = ':TSUpdate',
		config = require('conf.treesitter')
	}
end)

