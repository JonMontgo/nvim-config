return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'nvim-telescope/telescope.nvim',
      'mason-lspconfig.nvim',
      'ray-x/lsp_signature.nvim',
      'folke/lsp-colors.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      local lsp_util = require("lspconfig.util")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local tele = require("telescope.builtin")
      local hover = require("hover")

      vim.lsp.enable('gdscript')
      vim.lsp.config("*", { capabilities = capabilities })
      vim.lsp.config("pyright", {
        settings = {
          pyright = {
            disableOrganizeImports = true, -- Using ruff
          }
        }
      })
      vim.lsp.config("remark_ls", {
        settings = {
          remark = {
            requireConfig=true,
          }
        }
      })

      vim.api.nvim_create_autocmd('lspattach', {
        group = vim.api.nvim_create_augroup('userlspconfig', {}),
        callback = function(ev)
          -- enable completion triggered by <c-x><c-o>
          local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- setup signiture help
          require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
              border = "rounded"
            }
          }, ev.buf)

          local opts = {}

          -- lsp jumps.
          vim.keymap.set('n', 'gdc', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', tele.lsp_definitions, opts)
          vim.keymap.set('n', 'gr', tele.lsp_references, opts)
          vim.keymap.set('n', 'gt', tele.lsp_type_definitions, opts)
          vim.keymap.set('n', 'gs', tele.lsp_document_symbols, opts)
          vim.keymap.set('n', 'gws', tele.lsp_workspace_symbols, opts)
          -- vim.keymap.set('n', ']d', vim.diagnostic.get_next, opts)
          -- vim.keymap.set('n', '[d', vim.diagnostic.get_prev, opts)

          -- preview
          -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "K", hover.open, opts)

          -- workspace modifications
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', vim.lsp.buf.list_workspace_folders, opts)

          -- format action
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)



          -- Stop servers running in projects not supposed to
          if lsp_util.root_pattern("deno.json", "deno.jsonrc")(vim.fn.getcwd()) then
            if client.name == "ts_ls" then
              client:stop()
            end
          elseif lsp_util.root_pattern("tsconfig.json")(vim.fn.getcwd()) then
            if client.name == "denols" then
              client:stop()
            end
          end
          if not lsp_util.root_pattern(".eslintrc", "eslint.config.js", "eslint.config.ts", "eslint.config.mjs")(vim.fn.getcwd()) then
            if client.name == "eslint" then
              client:stop()
            end
          end
        end,
      })



    end
  }
}
