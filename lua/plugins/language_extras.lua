return {
  'hashivim/vim-terraform',
  -- 'Vimjas/vim-python-pep8-indent',
  {
    'folke/lazydev.nvim',
    ft = "lua",
    opts = {
      library = {
        vim.fn.stdpath("config") .. "/lua/customplugins/present"
      }
    },
  }
}
