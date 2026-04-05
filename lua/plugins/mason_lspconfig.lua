local servers = require("config.lsp_servers")

return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = servers,
    automatic_enable = false,
  },
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
}
