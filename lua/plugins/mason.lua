return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "pyright",
        "ruff",
        "lua_ls",
        "angularls",
        "denols",
        "gopls",
        "golangci_lint_ls",
        "tailwindcss",
        "emmet_ls",
        "cssls",
        "ts_ls",
        "eslint",
        "biome",
        "html",
        "jsonls",
        "terraformls"
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "stylua",    -- lua formatter
        "markdownlint"
      },
    })
  end,
}
