local plugins = {
  -- Fuzzy Finder
  {
    'junegunn/fzf',
    build = function() vim.fn['fzf#install']() end,
    dependencies = { 'junegunn/fzf.vim' },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- File Explorer
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  -- Avante Plugin
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/playground' },
  },

  -- Language Support
  'tomlion/vim-solidity',
  'hashivim/vim-terraform',
  'Vimjas/vim-python-pep8-indent',

  -- Database Tools
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',

  -- Note-taking
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Terminal Integration
  {
    'akinsho/toggleterm.nvim',
    version = '*',
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  -- Text Editing Enhancements
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  {
    'numToStr/Comment.nvim',
    opts={}
  },
  'wesQ3/vim-windowswap',
  'tpope/vim-fugitive',
  'evanleck/vim-svelte',
  'junegunn/vim-easy-align',

  -- Themes and UI
  'EdenEast/nightfox.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },
  'lukas-reineke/indent-blankline.nvim',
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require('notify')
      notify.setup {
        merge_duplicates = true,
        background_colour = '#000000',
      }
      vim.notify = notify
    end,
  },

  -- LSP and Autocompletion
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
  'stevearc/conform.nvim',
  'folke/lazydev.nvim',
}

require('lazy').setup(plugins)

