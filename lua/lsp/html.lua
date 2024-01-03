local completion = require('lsp/completion')

require('lspconfig')['tailwindcss'].setup{
  capabilities=completion.capabilities
}

require('lspconfig')['emmet_ls'].setup{
  capabilities=completion.capabilities
}

require('lspconfig')['cssls'].setup{
  capabilities=completion.capabilities
}

require('lspconfig')['html'].setup{
  capabilities=completion.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { "tailwindcss", "emmet_ls", "cssls", "html" }
}
