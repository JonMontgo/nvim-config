local common = require('lsp/common')

require('lspconfig')['tailwindcss'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require('lspconfig')['emmet_ls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require('lspconfig')['cssls'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require('lspconfig')['html'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { "tailwindcss", "emmet_ls", "cssls", "html" }
}
