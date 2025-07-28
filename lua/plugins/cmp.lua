return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'f3fora/cmp-spell',
      'kristijanhusak/vim-dadbod-completion',
      {
        'L3MON4D3/LuaSnip',
        version='v2.*',
        build = "make install_jsregexp",
      },
      'saadparwaiz1/cmp_luasnip',
    },
    config = function ()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp'},
            { name = 'spell' },
            { name = 'vim-dadbod-completion' },
            { name = 'buffer' },
            { name = 'path' }
          },
          {
            {name = 'buffer'} -- just buffer fallback
          }
        )
      }
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      vim.api.nvim_command('set completeopt=menu,menuone,noselect')
    end
  },
  {
    'petertriho/cmp-git',
    opts = {},
    init = function()
      table.insert(require("cmp").get_config().sources, { name = "git" })
    end
  },
}
