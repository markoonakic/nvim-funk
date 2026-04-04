local M = {}

local function sanitize_tab_buffers()
  local bufs = vim.t.bufs
  if type(bufs) ~= "table" then
    bufs = vim.tbl_filter(function(buf)
      return vim.api.nvim_buf_is_valid(buf) and vim.fn.buflisted(buf) == 1
    end, vim.api.nvim_list_bufs())
  end

  if #bufs == 0 then
    vim.t.bufs = {}
    return
  end

  local valid = {}
  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_valid(buf) then
      table.insert(valid, buf)
    end
  end

  local visible
  for i, buf in ipairs(valid) do
    if vim.fn.bufwinid(buf) ~= -1 then
      visible = i
      break
    end
  end

  if visible and visible > 1 then
    local buf = table.remove(valid, visible)
    table.insert(valid, 1, buf)
  elseif not visible then
    valid = {}
  end

  vim.t.bufs = valid
end

function M.patch()
  local nvdash = require("nvchad.nvdash")
  if nvdash._nvim_funk_patched then
    return
  end

  local original_open = nvdash.open

  nvdash.open = function(buf, win, action)
    sanitize_tab_buffers()
    return original_open(buf, win, action)
  end

  nvdash._nvim_funk_patched = true
end

return M
