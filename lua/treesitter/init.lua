require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "lua", "rust"},
  highlight = { 
    enable = true 
  },
  indent = {
    enable = true
  }
}

-- set folding to use tree sitter
vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
