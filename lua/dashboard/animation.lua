local M = {}

local api = vim.api
local uv = vim.uv or vim.loop

local frames = require("dashboard.frames")

local FPS = 15
local FRAME_INTERVAL_MS = math.floor(1000 / FPS)
local STARTUP_DELAY_MS = 20
local RESIZE_REQUERY_DELAY_MS = 50
local OVERLAY_PRIORITY = 50000

local state = {
  ns = api.nvim_create_namespace("dashboard_ascii_animation"),
  timer = nil,
  buf = nil,
  win = nil,
  frame_idx = 1,
  header_row = nil,
  win_width = nil,
}

local function valid_buf(buf)
  return buf and api.nvim_buf_is_valid(buf)
end

local function valid_win(win)
  return win and api.nvim_win_is_valid(win)
end

local function reset_state()
  state.buf = nil
  state.win = nil
  state.frame_idx = 1
  state.header_row = nil
  state.win_width = nil
end

local function stop()
  if state.timer then
    state.timer:stop()
    state.timer:close()
    state.timer = nil
  end

  if valid_buf(state.buf) then
    api.nvim_buf_clear_namespace(state.buf, state.ns, 0, -1)
  end

  reset_state()
end

local function find_header_row(buf)
  local ns_nvdash = api.nvim_create_namespace("nvdash")
  local marks = api.nvim_buf_get_extmarks(buf, ns_nvdash, 0, -1, { details = true })

  for _, mark in ipairs(marks) do
    local details = mark[4]
    local virt_text = details and details.virt_text
    if virt_text and virt_text[1] and virt_text[1][2] == "NvDashAscii" then
      return mark[2]
    end
  end
end

local function sync_layout()
  if not valid_buf(state.buf) or not valid_win(state.win) then
    return false
  end

  state.win_width = api.nvim_win_get_width(state.win)
  state.header_row = find_header_row(state.buf)
  return state.header_row ~= nil
end

local function overlay_frame(frame)
  if not valid_buf(state.buf) or not valid_win(state.win) or not state.header_row or not state.win_width then
    return
  end

  for i, line in ipairs(frame) do
    local row = state.header_row + (i - 1)
    local col = math.floor((state.win_width / 2) - math.floor(api.nvim_strwidth(line) / 2)) - 6

    api.nvim_buf_set_extmark(state.buf, state.ns, row, 0, {
      id = i,
      virt_text = { { line, "NvDashAscii" } },
      virt_text_win_col = col,
      priority = OVERLAY_PRIORITY,
      undo_restore = false,
      invalidate = true,
    })
  end
end

local function update()
  if not valid_buf(state.buf) or not valid_win(state.win) or vim.bo[state.buf].filetype ~= "nvdash" then
    stop()
    return
  end

  if not state.header_row and not sync_layout() then
    return
  end

  overlay_frame(frames[state.frame_idx] or frames[1] or {})
  state.frame_idx = (state.frame_idx % #frames) + 1
end

local function start(buf, win)
  if state.timer then
    stop()
  end

  state.buf = buf
  state.win = win
  state.frame_idx = 1

  if not sync_layout() then
    reset_state()
    return
  end

  state.timer = uv.new_timer()
  if not state.timer then
    reset_state()
    return
  end

  state.timer:start(0, FRAME_INTERVAL_MS, vim.schedule_wrap(update))
end

api.nvim_create_autocmd("FileType", {
  group = api.nvim_create_augroup("DashboardAsciiAnimation", { clear = true }),
  pattern = "nvdash",
  callback = function(ev)
    local buf = ev.buf

    vim.defer_fn(function()
      if not valid_buf(buf) then
        return
      end

      local win = vim.g.nvdash_win
      if not valid_win(win) then
        return
      end

      start(buf, win)
    end, STARTUP_DELAY_MS)
  end,
})

api.nvim_create_autocmd({ "BufWinLeave", "BufDelete" }, {
  group = api.nvim_create_augroup("DashboardAsciiAnimationCleanup", { clear = true }),
  callback = function(ev)
    if ev.buf == state.buf then
      stop()
    end
  end,
})

api.nvim_create_autocmd({ "WinResized", "VimResized" }, {
  group = api.nvim_create_augroup("DashboardAsciiAnimationResize", { clear = true }),
  callback = function()
    if not valid_buf(state.buf) or not valid_win(state.win) then
      return
    end

    vim.defer_fn(function()
      if valid_buf(state.buf) and valid_win(state.win) then
        sync_layout()
      end
    end, RESIZE_REQUERY_DELAY_MS)
  end,
})

M.stop = stop

return M
