return require('packer').startup(function()
  -- Manage packer with packer... neat trick
  use 'wbthomason/packer.nvim'

  -- FZF
  use {
    'junegunn/fzf',
    run = function() 
      vim.fn['fzf#install']() 
    end,
    requires = {'junegunn/fzf.vim'}  
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- Nvim tree
  use {
    'kyazdani42/nvim-tree.lua', 
    requires = {{ 'kyazdani42/nvim-web-devicons'}}
  }

  -- Global Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    requires = {{'nvim-treesitter/playground'}}
  }

  -- GoLang
  -- use {'fatih/vim-go', run = ':GoUpdateBinaries'}

  -- Solidity
  use 'tomlion/vim-solidity'

  -- Terraform 
  use 'hashivim/vim-terraform'

  -- Database
use { 'tpope/vim-dadbod' }
use { 'kristijanhusak/vim-dadbod-ui' }
use { 'kristijanhusak/vim-dadbod-completion' }

  -- Terminal Toggles
  use {'akinsho/toggleterm.nvim', tag = '*'}

  -- ETC
  use 'git@github.com:jiangmiao/auto-pairs.git' 
  use 'git@github.com:tpope/vim-surround.git'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-commentary'
  use 'git@github.com:wesQ3/vim-windowswap.git'
  use 'tpope/vim-fugitive'
  use 'evanleck/vim-svelte'
  use 'godlygeek/tabular'

  -- AESTHETICS
  use 'shaunsingh/nord.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'lukas-reineke/indent-blankline.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig', 
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'ray-x/lsp_signature.nvim'},
      {'folke/lsp-colors.nvim'},
      {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        dependencies = {
          {"nvim-tree/nvim-web-devicons"},
          --Please make sure you install markdown and markdown_inline parser
          {"nvim-treesitter/nvim-treesitter"}
        }
      },
      {
        'hrsh7th/nvim-cmp',
        requires = {
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-cmdline'},
          -- For vsnip users.
          {'hrsh7th/cmp-vsnip'},
          {'hrsh7th/vim-vsnip'}
        }
      }
    }
  }
end)
