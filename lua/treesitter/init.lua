require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "lua", "rust", "go"},
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
