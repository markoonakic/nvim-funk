return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  lazy = false,
  config = function()
    require("config.treesitter").setup_textobjects()
  end,
}
