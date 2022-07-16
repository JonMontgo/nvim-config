require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "<C-s>", action = "split" }
      }
    }
  }
})

vim.api.nvim_set_keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true })
