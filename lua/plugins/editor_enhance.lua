return {
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts={}
  },
  {
    'junegunn/vim-easy-align',
    config = function ()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })

      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })
    end
  }
  
}


