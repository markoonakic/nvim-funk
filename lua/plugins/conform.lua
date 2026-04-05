return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      go = { "goimports", "gofumpt" },
      bash = { "shfmt" },
      sh = { "shfmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      toml = { "taplo" },
      python = { "ruff_fix", "ruff_format" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_after_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 3000 }
    end,
  },
  keys = {
    {
      "<leader>fo",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format buffer",
    },
  },
}
