local M = {}

local diagnostic = require("lspsaga.diagnostic")
local definition = require("lspsaga.definition")
local hover = require("lspsaga.hover")
local signaturehelp = require("lspsaga.signaturehelp")
local rename = require("lspsaga.rename")
local codeaction = require("lspsaga.codeaction")

local lsp_flags = {
  debounce_text_changes = 150
}
M.lsp_flags = lsp_flags


local opts = { noremap=true, silent=true }
M.opts = opts

-- Setup diagnostic mappings
vim.keymap.set('n', '<space>e', diagnostic.show_line_diagnostics, opts)
vim.keymap.set('n', '[d', diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', diagnostic.goto_next, opts)


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities = capabilities


-- Setup Buffer attachment and keybindings
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Setup signiture help
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)

  -- Definition, Jumps, Docs.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', '<space>pd', definition.preview_definition, opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', 'K', hover.render_hover_doc, opts)
  vim.keymap.set('n', '<space>s', signaturehelp.signature_help, opts)

  -- Workspace modifications and inspect
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- Code modifications
  vim.keymap.set('n', '<space>rn', rename.lsp_rename, opts)
  vim.keymap.set('n', '<space>ca', codeaction.code_action, opts)
  vim.keymap.set("v", "<space>ca", function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    codeaction.range_code_action()
  end, opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
M.on_attach = on_attach

return M
