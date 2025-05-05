return {
  {
    'EdenEast/nightfox.nvim',
    config = function ()
      require('nightfox').setup {
        options = {
          transparent = true
        }
      }
      -- vim.g.nord_disable_background = true
      vim.cmd("colorscheme nordfox")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'nord'
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1, -- Just patch this so that I get relative paths instead name

          }
        }
      }
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('ibl').setup()
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
    end
  },
  'wesQ3/vim-windowswap',
  {
    'rcarriga/nvim-notify',
    config = function ()
      local notify = require("notify")
      notify.setup {
        merge_duplicates = true,
        background_colour = '#000000',
      }
      vim.notify = require("notify")
    end
  },
}
