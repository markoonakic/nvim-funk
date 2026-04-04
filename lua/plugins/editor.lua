return {
  {
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
  },
  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-mini/mini.ai",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "nvim-mini/mini.cursorword",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "nvim-mini/mini.pairs",
    version = "*",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "CmdlineEnter",
    config = function()
      require("numb").setup({
        show_cursorline = true,
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      hide_cursor = false,
    },
  },
}
