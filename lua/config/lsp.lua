local M = {}

function M.setup()
  vim.diagnostic.config({
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      },
    },
    virtual_text = {
      source = "if_many",
      prefix = "●",
      current_line = true,
    },
    underline = true,
    update_in_insert = false,
    float = {
      border = "rounded",
      source = "if_many",
    },
  })

  local group = vim.api.nvim_create_augroup("nvim_funk_lsp_attach", { clear = true })
  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client then
        return
      end

      local buf = ev.buf
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "LSP Definition")
      map("n", "gD", vim.lsp.buf.declaration, "LSP Declaration")
      map("n", "gr", vim.lsp.buf.references, "LSP References")
      map("n", "gi", vim.lsp.buf.implementation, "LSP Implementation")
      map("n", "gt", vim.lsp.buf.type_definition, "LSP Type Definition")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP Code Action")
      map("n", "<leader>rn", vim.lsp.buf.rename, "LSP Rename")
      map("n", "gh", vim.diagnostic.open_float, "Line Diagnostics")
      map("n", "K", vim.lsp.buf.hover, "LSP Hover")
      map("n", "<C-k>", vim.lsp.buf.signature_help, "LSP Signature Help")
      map("n", "<leader>rs", vim.lsp.buf.document_symbol, "LSP Document Symbols")

      if client.name == "markdown_oxide" then
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
          buffer = buf,
          callback = function()
            vim.lsp.codelens.enable(true, { bufnr = buf })
          end,
        })

        if vim.fn.exists(":Daily") == 0 then
          vim.api.nvim_create_user_command("Daily", function(opts)
            local command = opts.args ~= "" and ("daily " .. opts.args) or "daily"
            client:exec_cmd({
              title = ("Markdown-Oxide-%s"):format(command),
              command = "jump",
              arguments = { command },
            }, { bufnr = buf })
          end, { nargs = "?" })
        end
      elseif client.name == "ltex" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,
  })
end

return M
