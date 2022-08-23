local M = {}

local lsp_flags = {
  debounce_text_changes = 150
}
M.lsp_flags = lsp_flags


local opts = { noremap=true, silent=true }
local silent = { silent=true }
M.opts = opts

-- Saga mappings
vim.keymap.set('n', '<space>e', "<cmd>Lspsaga show_line_diagnostics<CR>", silent)
vim.keymap.set('n', '<space>e', "<cmd>Lspsaga show_cursor_diagnostics<CR>", silent)
vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_next<CR>", silent)
vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", silent)
vim.keymap.set('n', '<space>pd', "Lspsaga preview_definition <CR>", silent)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', silent)
vim.keymap.set('n', '<space>rn', '<cmd> Lspsaga rename<CR>', silent)
vim.keymap.set('n', '<space>ca', '<cmd> Lspsaga code_action<CR>', silent)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", silent)


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

  -- LSP Jumps.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Workspace modifications
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- Format action
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
M.on_attach = on_attach

return M
