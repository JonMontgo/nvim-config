local completion = require('lsp/completion')

require('lspconfig')['pyright'].setup{
  capabilities=completion.capabilities,
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
  }
}

require('lspconfig')['ruff'].setup{
  capabilities=completion.capabilities
}


require("mason-lspconfig").setup{
  ensure_installed = { "pyright", "ruff" }
}
