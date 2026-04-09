return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvchad.base46").load({ "treesitter" })
    require("config.treesitter").setup()
  end,
}
