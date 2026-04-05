return {
  "dmtrKovalenko/fff.nvim",
  lazy = false,
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {},
  keys = {
    {
      "<leader>ff",
      function()
        require("fff").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function()
        require("fff").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fw",
      function()
        require("fff").live_grep({ query = vim.fn.expand("<cword>") })
      end,
      desc = "Search current word",
    },
  },
}
