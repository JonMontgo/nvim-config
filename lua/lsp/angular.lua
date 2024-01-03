local completion = require('lsp/completion')

require('lspconfig')['angularls'].setup{  
  capabilities=completion.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { 'angularls' }
}
