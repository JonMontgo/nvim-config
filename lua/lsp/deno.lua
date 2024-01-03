local completion = require('lsp/completion')

require('lspconfig')['denols'].setup{
  capabilities=completion.capabilities
}
