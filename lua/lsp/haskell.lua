local common = require('lsp/common')

require('lspconfig')['hls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities,
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

require("mason-lspconfig").setup{
  ensure_installed = { "hls" }
}
