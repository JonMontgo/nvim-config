local completion = require('lsp/completion')

require('lspconfig')['gdscript'].setup{
  capabilities=completion.capabilities
}
