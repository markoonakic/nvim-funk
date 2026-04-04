return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvchad/ui",
    branch = "v3.0",
    lazy = false,
    config = function()
      require("nvchad")
    end,
  },
  {
    "nvchad/base46",
    branch = "v3.0",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvzone/volt",
    lazy = true,
  },
}
