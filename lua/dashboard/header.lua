local M = {}

local frames = require("dashboard.frames")

function M.get()
  local header = {}
  local first = frames[1] or {}

  for _, line in ipairs(first) do
    table.insert(header, line)
  end

  table.insert(header, "")

  return header
end

return M
