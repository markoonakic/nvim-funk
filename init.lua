vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
require("dashboard.animation")

local cache = vim.g.base46_cache
local uv = vim.uv or vim.loop

local ok_base46, base46 = pcall(require, "base46")
if ok_base46 and (vim.fn.isdirectory(cache) == 0 or #vim.fn.readdir(cache) == 0) then
  base46.load_all_highlights()
end

if vim.fn.isdirectory(cache) == 1 then
  for _, name in ipairs({ "defaults", "statusline" }) do
    local file = cache .. name
    if uv.fs_stat(file) then
      dofile(file)
    end
  end
end
