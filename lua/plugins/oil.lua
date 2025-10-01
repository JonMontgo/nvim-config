return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require("oil")
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open oil" })
    oil.setup({
      keymaps = {
        ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<leader>r"] = { "actions.refresh", mode = "n" },
      }
    })
  end
}
