local completion = require('lsp/completion')

require('lspconfig')['svelte'].setup{
  capabilities=completion.capabilities
}
