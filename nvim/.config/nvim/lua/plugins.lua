vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'theprimeagen/vim-be-good'

	use 'andweeb/presence.nvim'

	use 'kmonad/kmonad-vim'

	use {
		'ptzz/lf.vim',
		requires = 'voldikss/vim-floaterm',
		config = function() require('conf.lf') end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('conf.lualine') end
	}

	use { 'rose-pine/neovim', as = 'rosepine' }

	use { 'dracula/vim', as = 'dracula' }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('conf.treesitter') end
	}

	use 'airblade/vim-gitgutter'

	use {
		'neovim/nvim-lspconfig',
		requires = {'williamboman/mason.nvim', 'williamboman/mason-lspconfig'},
		config = function() require('conf.lsp') end
	}

	use 'lilydjwg/colorizer'
end)

