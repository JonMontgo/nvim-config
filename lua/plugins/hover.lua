return {
  "lewis6991/hover.nvim",
  config = function()
    local hover = require("hover")

    hover.setup {
      init = function()
        require("hover.providers.lsp")
        require("hover.providers.gh")
      end,
      preview_opts = {
        border = 'single'
      },
      preview_window = false,
      title = true,
    }
  end
}
