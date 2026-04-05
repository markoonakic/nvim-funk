return {
  "rmagatti/auto-session",
  lazy = false,
  init = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  opts = {
    auto_restore = true,
    auto_save = true,
    suppressed_dirs = { "~/", "~/Downloads", "/" },
    bypass_save_filetypes = { "nvdash" },
    lazy_support = true,
    session_lens = {
      picker = "select",
    },
  },
  keys = {
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
    { "<leader>wR", "<cmd>AutoSession search<CR>", desc = "Choose session to restore" },
  },
}
