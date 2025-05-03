require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "go",
    "python",
    "tsx",
    "typescript",
    "dockerfile",
    "json",
    "json5",
    "yaml"
  },
  auto_install=true,
  highlight = { 
    enable = true 
  },
  indent = {
    enable = true,
  }
}

-- set folding to use tree sitter
vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
