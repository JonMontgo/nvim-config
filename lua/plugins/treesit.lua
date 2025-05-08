return {
  {
    'nvim-treesitter/playground',
    dependencies = {'nvim-treesitter/nvim-treesitter'}
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-treesitter/playground' },
    config = function ()
      vim.opt.foldmethod='expr'
      vim.opt.foldexpr='nvim_treesitter#foldexpr()'
      require 'nvim-treesitter.configs'.setup {
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
          "yaml",
          "markdown",
          "markdown_inline"
        },
        auto_install=true,
        highlight = {
          enable = true
        },
        indent = {
          enable = true,
        }
      }
    end
  },
}

