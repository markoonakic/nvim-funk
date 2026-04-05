return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  keys = {
    { "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
  },
}
