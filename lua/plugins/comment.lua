return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_current)",
      mode = "n",
      desc = "Toggle Comment",
    },
    {
      "<leader>/",
      "<Plug>(comment_toggle_linewise_visual)",
      mode = "v",
      desc = "Toggle Comment",
    },
  },
}
