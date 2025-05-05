local percent_height = .3
local percent_width = .3

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function ()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "horizontal" then
            return math.max(math.floor(vim.o.lines * percent_height), 15)
          elseif term.direction == "vertical" then
            return math.max(math.floor(vim.o.columns * percent_width), 15)
          end
        end,
        open_mapping = [[<leader>to]],
        shade_filetypes = {},
        direction = 'horizontal',
        persist_mode = true,
        persist_size = true
      }
      vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-N>', { noremap = true })
    end
  }
}

