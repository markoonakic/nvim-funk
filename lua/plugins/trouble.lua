return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<leader>dq", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    { "<leader>dQ", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
  },
  opts = {
    focus = true,
  },
}
