local completion = require('lsp/completion')

require('lspconfig')['hls'].setup{
  capabilities=completion.capabilities,
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

require("mason-lspconfig").setup{
  ensure_installed = { "hls" }
}
