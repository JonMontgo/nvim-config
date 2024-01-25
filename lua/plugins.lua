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

  -- ChatGPT
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
})

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

  -- Python
  use 'Vimjas/vim-python-pep8-indent'

  -- Database
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui' }
  use { 'kristijanhusak/vim-dadbod-completion' }

  -- Notes
  use {
    "epwalsh/obsidian.nvim",
    tags="*",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- Terminal Toggles
  use {'akinsho/toggleterm.nvim', tag = '*'}

  -- ETC
  use {
    'windwp/nvim-autopairs',
    config = function() 
      require("nvim-autopairs").setup {}
    end
  } 
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-commentary'
  use 'wesQ3/vim-windowswap'
  use 'tpope/vim-fugitive'
  use 'evanleck/vim-svelte'
  use 'junegunn/vim-easy-align'

  -- AESTHETICS
  use 'EdenEast/nightfox.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use({
    "giusgad/pets.nvim",
    requires = {
      "giusgad/hologram.nvim",
      "MunifTanjim/nui.nvim",
    }
  })
  use {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        background_colour = "#000000"
      })
    end
  }

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
  use {
    'nvimtools/none-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
end)
