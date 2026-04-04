return {
  {
    "folke/snacks.nvim",
    main = "snacks",
    lazy = false,
    priority = 1000,
    keys = {
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete buffer",
      },
      {
        "<leader>bo",
        function()
          Snacks.bufdelete.other()
        end,
        desc = "Delete other buffers",
      },
    },
    opts = {
      lazygit = {},
      toggle = {},
      terminal = {},
      zen = {
        toggles = {
          dim = false,
        },
      },
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
    config = function(_, opts)
      local Snacks = require("snacks")

      Snacks.setup(opts)
      Snacks.toggle.zen():map("<leader>zm", { desc = "Zen mode" })
      Snacks.toggle.zoom():map("<leader>sz", { desc = "Zoom split" })
      Snacks.toggle.diagnostics():map("<leader>ud", { desc = "Diagnostics" })
      Snacks.toggle.inlay_hints():map("<leader>uh", { desc = "Inlay hints" })
      Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
      Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
      Snacks.toggle
        .new({
          id = "global_autoformat",
          name = "Global Auto Format",
          get = function()
            return not vim.g.disable_autoformat
          end,
          set = function(state)
            vim.g.disable_autoformat = not state
          end,
        })
        :map("<leader>uf")
      Snacks.toggle
        .new({
          id = "buffer_autoformat",
          name = "Buffer Auto Format",
          get = function()
            return not vim.b.disable_autoformat
          end,
          set = function(state)
            vim.b.disable_autoformat = not state
          end,
        })
        :map("<leader>uF")
    end,
  },
}
