local servers = require("config.lsp_servers")

return {
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
}
