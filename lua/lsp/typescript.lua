local common = require('lsp/common')

require('lspconfig')['tsserver'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require('lspconfig')['eslint'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}


-- vim.api.nvim_command("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")
