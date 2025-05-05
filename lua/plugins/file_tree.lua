return {
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
      vim.api.nvim_set_keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true })
    end
  }
}
