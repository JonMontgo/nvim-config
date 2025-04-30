require'nvim-treesitter.configs'.setup {
  auto_install = {
    "c",
    "lua",
    "rust",
    "go",
    "python",
    "tsx",
    "typescript",
    "dockerfile"
  },
  highlight = { 
    enable = true 
  },
  indent = {
    enable = true,
    disable = { "python" }
  }
}

-- set folding to use tree sitter
vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
