local completion = require('lsp/completion')
require('lspconfig')['golangci_lint_ls'].setup{
  capabilities=completion.capabilities
}
require('lspconfig')['gopls'].setup{
  capabilities=completion.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { "gopls", "golangci_lint_ls" }
}
