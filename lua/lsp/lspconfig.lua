local lspconfig = require('lspconfig')
local lspsaga = require('lspsaga')
local notify = require('notify')

-- Saga mappings
vim.keymap.set('n', '<space>e', "<cmd>Lspsaga show_line_diagnostics<CR>", silent)
vim.keymap.set('n', '<space>e', "<cmd>Lspsaga show_cursor_diagnostics<CR>", silent)
vim.keymap.set('n', '<space>gf', "<cmd>Lspsaga lsp_finder<CR>", silent) -- go find
vim.keymap.set('n', '<space>o', "<cmd>Lspsaga outline<CR>", silent)
vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", silent)
vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", silent)
vim.keymap.set('n', '<space>pd', "Lspsaga preview_definition <CR>", silent)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', silent)
vim.keymap.set('n', '<space>rn', '<cmd> Lspsaga rename<CR>', silent)
vim.keymap.set('n', '<space>ca', '<cmd> Lspsaga code_action<CR>', silent)
vim.keymap.set("v", "<space>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", silent)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Setup signiture help
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = {
        border = "rounded"
      }
    }, ev.buf)

    local opts = { buffer = ev.buffer}

    -- LSP Jumps.
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<space>gd', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    -- Workspace modifications
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- Format action
    vim.keymap.set('n', '<space>f', function() 
      vim.lsp.buf.format { async = true }
    end, opts)
  end,

})

