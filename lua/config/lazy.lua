local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins.ui" },
    { import = "plugins.snacks" },
    { import = "plugins.navigation" },
    { import = "plugins.sessions" },
    { import = "plugins.support" },
    { import = "plugins.editor" },
    { import = "plugins.git" },
    { import = "plugins.diagnostics" },
    { import = "plugins.treesitter" },
    { import = "plugins.lsp" },
    { import = "plugins.completion" },
    { import = "plugins.formatting" },
    { import = "plugins.markdown" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false, notify = false },
  change_detection = { notify = false },
  rocks = { enabled = false },
})
