local plugins = {
  {
    'junegunn/fzf',
    build = function() vim.fn['fzf#install']() end,
    dependencies = { 'junegunn/fzf.vim' },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  {
    'jackMort/ChatGPT.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('chatgpt').setup()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/playground' },
  },
  'tomlion/vim-solidity',
  'hashivim/vim-terraform',
  'Vimjas/vim-python-pep8-indent',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  'tpope/vim-commentary',
  'wesQ3/vim-windowswap',
  'tpope/vim-fugitive',
  'evanleck/vim-svelte',
  'junegunn/vim-easy-align',
  'EdenEast/nightfox.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  'lukas-reineke/indent-blankline.nvim',
  {
    'giusgad/pets.nvim',
    dependencies = {
      'giusgad/hologram.nvim',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        merge_duplicates = true,
        background_colour = '#000000',
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'ray-x/lsp_signature.nvim',
      'folke/lsp-colors.nvim',
      {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        dependencies = {
          'nvim-tree/nvim-web-devicons',
          'nvim-treesitter/nvim-treesitter',
        },
      },
      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip',
        },
      },
    },
  },
  'folke/lazydev.nvim',
  'stevearc/conform.nvim',
}

require('lazy').setup(plugins)
