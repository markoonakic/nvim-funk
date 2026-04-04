return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps",
      },
    },
  },
  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".gitignore"] = { glyph = "󰊢", hl = "MiniIconsOrange" },
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
        [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        [".node-version"] = { glyph = "", hl = "MiniIconsGreen" },
        [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
        [".yarnrc.yml"] = { glyph = "", hl = "MiniIconsBlue" },
        ["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
        ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" },
        ["config"] = { glyph = "", hl = "MiniIconsBlue" },
        [".project"] = { glyph = "", hl = "MiniIconsBlue" },
        [".classpath"] = { glyph = "", hl = "MiniIconsBlue" },
        ["license"] = { glyph = "", hl = "MiniIconsYellow" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", desc = "Tmux Navigate Left" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>", desc = "Tmux Navigate Down" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>", desc = "Tmux Navigate Up" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", desc = "Tmux Navigate Right" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>", desc = "Tmux Navigate Previous" },
    },
  },
}
