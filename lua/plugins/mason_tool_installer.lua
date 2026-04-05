return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "stylua",
      "clang-format",
      "gofumpt",
      "goimports",
      "shfmt",
      "prettierd",
      "prettier",
      "taplo",
      "ruff",
    },
    run_on_start = true,
  },
}
