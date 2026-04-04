return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        vim.schedule(function()
          local gs = require("gitsigns")

          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "]h", gs.next_hunk, "Git Next Hunk")
          map("n", "[h", gs.prev_hunk, "Git Prev Hunk")
          map("n", "<leader>hs", gs.stage_hunk, "Git Stage Hunk")
          map("n", "<leader>hr", gs.reset_hunk, "Git Reset Hunk")
          map("v", "<leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Git Stage Hunk")
          map("v", "<leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Git Reset Hunk")
          map("n", "<leader>hS", gs.stage_buffer, "Git Stage Buffer")
          map("n", "<leader>hR", gs.reset_buffer, "Git Reset Buffer")
          map("n", "<leader>hu", gs.undo_stage_hunk, "Git Undo Stage Hunk")
          map("n", "<leader>hp", gs.preview_hunk, "Git Preview Hunk")
          map("n", "<leader>hi", gs.preview_hunk_inline, "Git Preview Hunk Inline")
          map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
          end, "Git Blame Line")
          map("n", "<leader>hB", gs.toggle_current_line_blame, "Git Toggle Line Blame")
          map("n", "<leader>hd", gs.diffthis, "Git Diff This")
          map("n", "<leader>hD", function()
            gs.diffthis("~")
          end, "Git Diff This ~")
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git Select Hunk")
        end)
      end,
    },
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}
