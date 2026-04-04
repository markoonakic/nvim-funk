return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "rmd" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.icons",
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle Render Markdown" },
    },
    opts = {
      code = {
        sign = true,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = true,
        icons = {},
      },
      checkbox = {
        enabled = false,
      },
      completions = {
        lsp = {
          enabled = true,
        },
      },
    },
    config = function(_, opts)
      require("config.markdown").setup()
      require("render-markdown").setup(opts)
    end,
  },
}
