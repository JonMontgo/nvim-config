require('files/telescope-kb')
require("nvim-tree").setup({})
vim.api.nvim_set_keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", { noremap = true })
