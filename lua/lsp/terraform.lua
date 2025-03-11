local completion = require('lsp/completion')

require('lspconfig')['terraformls'].setup{
  capabilities=completion.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { "terraformls" }
}
