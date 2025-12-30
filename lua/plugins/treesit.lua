return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy=false,
    config = function ()
      require('nvim-treesitter').install {
        "c",
        "bash",
        "toml",
        "terraform",
        "html",
        "css",
        "nix",
        "go",
        "lua",
        "rust",
        "go",
        "python",
        "tsx",
        "jsx",
        "typescript",
        "javascript",
        "dockerfile",
        "json",
        "json5",
        "yaml",
        "markdown",
        "markdown_inline"
      }
      vim.wo[0][0].foldmethod='expr'
      vim.wo[0][0].foldexpr='v:lua.vim.treesitter.foldexpr()'
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {'*'},
        callback = function(args)
          if not pcall(vim.treesitter.start) then
            vim.bo[args.buf].syntax = 'on'
          end
        end,
      })
    end
  },
}

