return {
  "nvchad/ui",
  branch = "v3.0",
  lazy = false,
  config = function()
    require("nvchad")
    require("config.nvdash_compat").patch()
  end,
}
