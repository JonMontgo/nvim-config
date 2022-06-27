local common = require('lsp/common')

require('lspconfig')['golangci_lint_ls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}
