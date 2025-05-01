local obsidian = require("obsidian")
local Path = require("plenary.path")

local personal_vault = Path:new(Path:new("~/vaults/Personal"):expand())


if not personal_vault:exists() then
  vim.notify("Creating ~/vaults/Personal for obsidian", vim.log.levels.WARN)
  personal_vault:mkdir({ parents = true })
end


obsidian.setup {
  workspaces = {
    {
      name = "Personal",
      path = "~/vaults/Personal",
    },
  },
}
vim.opt_local.conceallevel = 1
