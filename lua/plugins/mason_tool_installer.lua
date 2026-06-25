local mason_auto_install = vim.env.NVIM_MASON_AUTO_INSTALL ~= "0"

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {
    ensure_installed = mason_auto_install and {
      "stylua",
      "clang-format",
      "gofumpt",
      "goimports",
      "shfmt",
      "prettierd",
      "prettier",
      "taplo",
      "ruff",
    } or {},
    run_on_start = mason_auto_install,
  },
}
