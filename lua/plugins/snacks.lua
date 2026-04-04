return {
  {
    "folke/snacks.nvim",
    main = "snacks",
    lazy = false,
    priority = 1000,
    opts = {
      lazygit = {},
      terminal = {},
      styles = {
        lazygit = {
          width = 0.96,
          height = 0.94,
          border = "rounded",
          title = " LazyGit ",
          title_pos = "center",
        },
        terminal_float = {
          position = "float",
          width = 0.94,
          height = 0.9,
          border = "rounded",
          title = " Terminal ",
          title_pos = "center",
        },
      },
    },
  },
}
