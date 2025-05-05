return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'ray-x/lsp_signature.nvim',
      'folke/lsp-colors.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function ()
      local lsp_cfg = require("lspconfig")
      local mason_lsp = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd('lspattach', {
        group = vim.api.nvim_create_augroup('userlspconfig', {}),
        callback = function(ev)
          -- enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- setup signiture help
          require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
              border = "rounded"
            }
          }, ev.buf)

          local opts = { buffer = ev.buffer}

          -- lsp jumps.
          vim.keymap.set('n', 'gdc', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

          -- workspace modifications
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)

          -- format action
          vim.keymap.set('n', '<space>f', function() 
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      mason_lsp.setup_handlers {
        function(server_name)
          lsp_cfg[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["pyright"] = function()
          lsp_cfg.pyright.setup {
            capabilities = capabilities,
            settings = {
              pyright = {
                disableOrganizeImports = true, -- Using ruff
              }
            }
          }
        end
      }

      require('lspconfig')['gdscript'].setup{
        capabilities=capabilities
      }
    end
  }
}
