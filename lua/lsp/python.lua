local common = require('lsp/common')

require('lspconfig')['pyright'].setup{
  on_attach = common.on_attach,
  flags = common.lsp_flags,
  capabilities = common.capabilities
}


-- Setup lspconfig.

require('lspconfig').efm.setup {
  filetypes = { 'python' },
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  flags = common.lsp_flags,
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
