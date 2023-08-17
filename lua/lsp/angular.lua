local common = require('lsp/common')

require('lspconfig')['angularls'].setup{
  onAttach=common.onAttach
  onAttach=common.lsp_flags,
  capabilities=common.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { 'angularls' }
}
