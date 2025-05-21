local M = {}

function M.create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns)
  local height = opts.height or math.floor(vim.o.lines)

  -- Calclulate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  vim.bo[buf].bufhidden = 'wipe'

  -- Define window configuration
  ---@type vim.api.keyset.win_config
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    zindex = 10,
    col = col,
    row = row,
    style = "minimal",
    border = "none"
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end


---@param parent_win integer: window number of parent
---@param total_slides integer
---@param current_slide integer
---@diagnostic disable-next-line: unused-function
function M.create_footer_window(parent_win, total_slides, current_slide)
  ---@param index integer
  local function make_footer_text(index)
    return string.format("Slide %d/%d", index, total_slides)
  end
  local footer_text = make_footer_text(current_slide)

  local win_height = vim.api.nvim_win_get_height(parent_win)
  local win_width = vim.api.nvim_win_get_width(parent_win)

  local col = math.floor((win_width - #footer_text) / 2)
  local row = win_height - 1

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { footer_text })
  vim.bo[buf].bufhidden = "wipe"

  ---@param text string
  local function get_dyn_config(text)
    ---@type vim.api.keyset.win_config
    return {
      row = row,
      col = col,
      width = #text,
      height = 1,
      relative = 'win',
      win = parent_win,
      zindex = 11,
      style = "minimal",
      border = "none",
    }
  end

  local win = vim.api.nvim_open_win(buf, false,
    vim.tbl_extend(
      "force",
      get_dyn_config(footer_text),
      {
        noautocmd = true,
      }
    )
  )

  -- Tie close of parent to close of footer
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(win),
    callback = function()
      pcall(vim.api.nvim_win_close, win, true)
    end
  })

  return {
    buf = buf,
    win = win,
    update = function(new_index)
      local new_text = make_footer_text(new_index)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, { new_text })
      local config = get_dyn_config(new_text)
      vim.api.nvim_win_set_config(win, config)
    end
  }
end

return M
