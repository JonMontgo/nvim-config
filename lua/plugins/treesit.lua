return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy=false,
    config = function ()
      local parsers = {
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
      local function try_install(attempts_left)
        local ts = require('nvim-treesitter')
        if type(ts.install) == 'function' then
          ts.install(parsers)
        elseif attempts_left > 0 then
          vim.defer_fn(function() try_install(attempts_left - 1) end, 5000)
        else
          vim.notify('nvim-treesitter: install() still unavailable, giving up. Try :Lazy sync.', vim.log.levels.WARN)
        end
      end
      try_install(5)
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

