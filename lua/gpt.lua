require("chatgpt").setup()

vim.api.nvim_set_keymap('n', '<leader>?', ':ChatGPT<CR>', { noremap = true, silent = true })
