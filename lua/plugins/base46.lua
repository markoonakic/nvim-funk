return {
  "nvchad/base46",
  branch = "v3.0",
  lazy = false,
  build = function()
    require("base46").load_all_highlights()
  end,
}
