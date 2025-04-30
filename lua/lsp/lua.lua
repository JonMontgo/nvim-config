local completion = require('lsp/completion')

require('lspconfig')['lua_ls'].setup{
  capabilities=completion.capabilities,
}

require("mason-lspconfig").setup{
  ensure_installed = { "lua_ls" }
}

require('lazydev').setup()
