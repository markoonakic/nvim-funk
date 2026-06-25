local mason_auto_install = vim.env.NVIM_MASON_AUTO_INSTALL ~= "0"

return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {
    PATH = mason_auto_install and "prepend" or "skip",
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
