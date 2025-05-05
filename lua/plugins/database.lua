return {
  {
    'tpope/vim-dadbod',
    config = function ()
      vim.keymap.set('n', '<leader>du', ':DBUIToggle<CR>', { noremap=true, silent=true })
      vim.keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>', { noremap=true, silent=true })
      vim.keymap.set('n', '<leader>dr', ':DBUIRenameBuffer<CR>', { noremap=true, silent=true })
      vim.keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>', { noremap=true, silent=true })
      vim.g.db_ui_save_location = '~/.config/db_ui'
    end,
  },
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
}

