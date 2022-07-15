require("toggleterm").setup{
  size = 28,
  open_mapping = [[<leader>to]],
  shade_filetypes = {},
  direction = 'horizontal',
  persist_mode = true,
  persist_size = true
}

-- Keybindings in terminal
vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-N>', { noremap = true })
