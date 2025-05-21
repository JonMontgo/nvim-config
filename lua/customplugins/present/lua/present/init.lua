local win_ctrl = require("present.window_controls")

local M = {}

---@class present.Slides
---@field slides string[]: The slides of the file

---@class present.Options

---@class present.PresentOptions
---@field bufnr integer: The number for the buffer to render slides from



--- Takes some lines and pareses them
---@param lines string[]: The lines in the buffer
local parse_slides = function(lines)
  local slides = { slides = {} }
  local current_slide = {}

  local seperator = "^---$"

  for _, line in ipairs(lines) do
    if line:find(seperator) then
      if #current_slide > 0 then
        table.insert(slides.slides, current_slide)
      end

      current_slide = {}
    else
      table.insert(current_slide, line)
    end
  end

  table.insert(slides.slides, current_slide)

  return slides
end

---@param opts present.PresentOptions
M.start_presentation = function(opts)
  opts = opts or {}
  opts.bufnr = opts.bufnr or 0 -- 0 is current buffer
  local lines = vim.api.nvim_buf_get_lines(opts.bufnr, 0, -1, false)
  local parsed = parse_slides(lines)
  local float = win_ctrl.create_floating_window()

  -- Hotkeys and slide control
  local current_slide = 1
  local footer_float = win_ctrl.create_footer_window(float.win, #parsed.slides, current_slide)
  vim.keymap.set("n", "l", function()
    current_slide = math.min(current_slide + 1, #parsed.slides)
    vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[current_slide])
    footer_float.update(current_slide)
  end, { buffer = float.buf })
  vim.keymap.set("n", "h", function()
    current_slide = math.max(1, current_slide - 1)
    vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[current_slide])
    footer_float.update(current_slide)
  end, { buffer = float.buf })
  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(float.win, true)
    vim.api.nvim_win_close(footer_float.win, true)
  end, { buffer = float.buf })

  local restore = {
    cmdheight = {
      original = vim.o.cmdheight,
      present = 0
    }
  }
  for option, config in pairs(restore) do
    vim.opt[option] = config.present
  end
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = float.buf,
    callback = function()
      for option, config in pairs(restore) do
        vim.opt[option] = config.original
      end
    end
  })

  -- Set markdown rendering on slide buff
  vim.bo[float.buf].filetype = "markdown"
  -- require("render-markdown.core.manager").attach(float.buf)

  vim.api.nvim_buf_set_lines(float.buf, 0, -1, false, parsed.slides[current_slide])
end


---@param opts present.Options: The options
function M.setup(opts)
  vim.api.nvim_create_user_command("PresentMarkdown", M.start_presentation, {})
end

return M
