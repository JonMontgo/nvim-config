local M = {}

function M.hello_world()
  vim.notify("Hello world")
  print("Hello World")
end

function M.setup()
  -- vim.notify("Loaded plugin!", vim.log.levels.INFO, { title = "foobar" })

  vim.api.nvim_create_user_command('HelloWorld', M.hello_world, {})
end

return M
