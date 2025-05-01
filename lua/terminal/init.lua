local percent_height = .4
local percent_width = .4
require("toggleterm").setup{
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * percent_height
    elseif term.direction == "vertical" then
      return vim.o.columns * percent_width
    end
  end,
  open_mapping = [[<leader>to]],
  shade_filetypes = {},
  direction = 'horizontal',
  persist_mode = true,
  persist_size = true
}

-- Keybindings in terminal
vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-N>', { noremap = true })
