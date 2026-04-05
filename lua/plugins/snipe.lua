return {
  "leath-dub/snipe.nvim",
  opts = {
    ui = {
      position = "center",
      open_win_override = {
        border = vim.o.winborder ~= "" and vim.o.winborder or "single",
        title = { { " Buffers ", "SnipeTitle" } },
        title_pos = "left",
      },
    },
  },
  keys = {
    {
      "<leader>fb",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open buffer menu",
    },
  },
}
