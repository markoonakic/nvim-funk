local servers = {
  "lua_ls",
  "markdown_oxide",
  "ltex",
  "clangd",
  "gopls",
  "vtsls",
  "emmet_language_server",
  "yamlls",
  "taplo",
  "html",
  "cssls",
  "tailwindcss",
}

return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    keys = {
      { "<leader>ms", "<cmd>Mason<CR>", desc = "Mason" },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = servers,
      automatic_enable = false,
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("config.lsp").setup()

      local capabilities = nil
      local ok_blink, blink = pcall(require, "blink.cmp")
      if ok_blink then
        capabilities = blink.get_lsp_capabilities()
      end

      for _, server in ipairs(servers) do
        vim.lsp.config(server, capabilities and { capabilities = capabilities } or {})
      end

      vim.lsp.enable(servers)
    end,
  },
}
