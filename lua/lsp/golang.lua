local common = require('lsp/common')

require('lspconfig')['golangci_lint_ls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require('lspconfig')['gopls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { "gopls", "golangci_lint_ls" }
}
