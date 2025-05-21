return {
  {
    dir = vim.fn.stdpath("config") .. "/lua/customplugins/present",
    name = "present",
    opts = {},
    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim'
    }
  }
}
