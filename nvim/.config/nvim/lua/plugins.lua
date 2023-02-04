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

	--TODO minimise
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		-- LSP Support
		'neovim/nvim-lspconfig',             -- Required
		'williamboman/mason.nvim',           -- Optional
		'williamboman/mason-lspconfig.nvim', -- Optional

		-- Autocompletion
		'hrsh7th/nvim-cmp',         -- Required
		'hrsh7th/cmp-nvim-lsp',     -- Required
		'hrsh7th/cmp-buffer',       -- Optional
		'hrsh7th/cmp-path',         -- Optional
		'saadparwaiz1/cmp_luasnip', -- Optional
		'hrsh7th/cmp-nvim-lua',     -- Optional

		-- Snippets
		'L3MON4D3/LuaSnip',             -- Required
		'rafamadriz/friendly-snippets', -- Optional
	  },
	  config = require('conf.lsp')
	}

end)

