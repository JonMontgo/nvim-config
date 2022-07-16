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
    requires = {{ 'kyazdani42/nvim-web-devicons', opt = true }}
  }

  -- Global Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    requires = {{'nvim-treesitter/playground', opt = true}}
  }

  -- GoLang
  use {'fatih/vim-go', run = ':GoUpdateBinaries'}

  -- Solidity
  use 'tomlion/vim-solidity'

  -- Terraform 
  use 'hashivim/vim-terraform'

  -- Terminal Toggles
  use {'akinsho/toggleterm.nvim', tag = 'v1.*'}

  -- ETC
  use 'git@github.com:jiangmiao/auto-pairs.git' 
  use 'git@github.com:tpope/vim-surround.git'
  use 'tpope/vim-commentary'
  use 'git@github.com:wesQ3/vim-windowswap.git'
  use 'tpope/vim-fugitive'
  use 'evanleck/vim-svelte'
  use 'godlygeek/tabular'

  -- AESTHETICS
  use 'shaunsingh/nord.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'lukas-reineke/indent-blankline.nvim'

  -- LSP
  use {
    'neovim/nvim-lspconfig', 
    requires = {
      {'williamboman/nvim-lsp-installer', opt = true},
      {'ray-x/lsp_signature.nvim', opt = true},
      {'folke/lsp-colors.nvim', opt = true},
      {'glepnir/lspsaga.nvim', branch = 'main'},
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
