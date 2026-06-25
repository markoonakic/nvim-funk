local servers = require("config.lsp_servers")
local mason_auto_install = vim.env.NVIM_MASON_AUTO_INSTALL ~= "0"

return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = mason_auto_install and servers or {},
    automatic_enable = false,
  },
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
}
