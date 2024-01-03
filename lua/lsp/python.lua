local completion = require('lsp/completion')

require('lspconfig')['pyright'].setup{
  capabilities=completion.capabilities
}

-- Setup lspconfig.

require('lspconfig').efm.setup {
  filetypes = { 'python' },
  capabilities=completion.capabilities,
  init_options = { documentFormatting=true },
  settings = {
    rootMarkets = {".git/"},
    languages = {
      python = {
        {
          formatCommand = "black --quiet -",
          formatStdin = true
        },
        {
          formatCommand = "isort --quiet -",
          formatStdin = true
        }
      }
    }
  }
}


require("mason-lspconfig").setup{
  ensure_installed = { "pyright", "efm" }
}
