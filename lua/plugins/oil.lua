return {
  'stevearc/oil.nvim',
  config=function ()
    local oil = require("oil")
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open oil"})
    oil.setup()
  end
}
