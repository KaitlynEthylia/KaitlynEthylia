vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'theprimeagen/vim-be-good'

	use 'andweeb/presence.nvim'

	use 'kmonad/kmonad-vim'

	use {
		'ptzz/lf.vim',
		requires = 'voldikss/vim-floaterm',
		config = require('conf.lf')
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = require('conf.lualine')
	}

	use { 'rose-pine/neovim', as = 'rosepine' }

	use { 'dracula/vim', as = 'dracula' }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = require('conf.treesitter')
	}

	use 'airblade/vim-gitgutter'

	use {
		'neovim/nvim-lspconfig',
		requires = {'williamboman/mason.nvim', 'williamboman/mason-lspconfig'},
		config = require('conf.lsp')
	}
end)

