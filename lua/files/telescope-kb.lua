local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fr", builtin.live_grep, {}) -- ripgrep this
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
