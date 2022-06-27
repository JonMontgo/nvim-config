common = require('lsp/common')

require('lspconfig')['tailwindcss'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require('lspconfig')['emmet_ls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}
