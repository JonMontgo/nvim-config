return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fr", builtin.live_grep, {}) -- ripgrep this
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fgl", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fsf", function() builtin.find_files { cwd = "src" } end, {})
      vim.keymap.set("n", "<leader>fws", builtin.lsp_workspace_symbols, {})
      vim.keymap.set("n", "<leader>fds", builtin.lsp_document_symbols, {})
    end
  }
}
