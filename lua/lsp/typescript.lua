local completion = require('lsp/completion')

require('lspconfig')['ts_ls'].setup{
  capabilities=completion.capabilities
}

require('lspconfig')['eslint'].setup{
  capabilities=completion.capabilities
}

require("mason-lspconfig").setup{
  ensure_installed = { "tsserver", "eslint" }
}
-- vim.api.nvim_command("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")
