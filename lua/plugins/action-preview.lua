return {
  "aznhe21/actions-preview.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local ap = require("actions-preview")
    vim.keymap.set({ "v", "n" }, "<leader>ca", ap.code_actions)
    return {
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    }
  end
}
