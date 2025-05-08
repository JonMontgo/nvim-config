return {
  {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('lspsaga').setup {
        lightbulb = {
          enable = false,
        },
      }
      local silent = { silent = true }
      vim.keymap.set('n', '<space>ld', "<cmd>Lspsaga show_line_diagnostics<cr>", silent)
      vim.keymap.set('n', '<space>cd', "<cmd>Lspsaga show_cursor_diagnostics<cr>", silent)
      vim.keymap.set('n', '<space>o', "<cmd>Lspsaga outline<cr>", silent)
      -- vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>')
      -- vim.keymap.set('n', 'gt', '<cmd>Lspsaga goto_type_definition<cr>')
      -- vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<cr>", silent)
      -- vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<cr>", silent)
      -- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', silent) this broke... idk why
      -- vim.keymap.set('n', '<space>rn', '<cmd> Lspsaga rename<cr>', silent)
      -- vim.keymap.set('n', '<space>ca', '<cmd> Lspsaga code_action<cr>', silent)
    end
  },
}

