local obsidian = require("obsidian")
obsidian.setup{
  workspaces = {
    {
      name = "Personal",
      path = "~/vaults/Personal",
    },
  },
}
vim.opt_local.conceallevel = 1
