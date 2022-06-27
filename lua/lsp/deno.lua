common = require('lsp/common')

require('lspconfig')['denols'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}
