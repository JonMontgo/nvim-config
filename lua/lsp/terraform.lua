local common = require('lsp/common')

require('lspconfig')['svelte'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}
