return {
  {
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
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    opts = {
      open_for_directories = false,
    },
    keys = {
      {
        "<leader>-",
        "<cmd>Yazi<CR>",
        desc = "Open Yazi",
      },
    },
  },
  {
    "leath-dub/snipe.nvim",
    opts = {
      ui = {
        position = "center",
        open_win_override = {
          border = "rounded",
          title = " Buffers ",
          title_pos = "center",
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
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and replace",
      },
    },
  },
}
