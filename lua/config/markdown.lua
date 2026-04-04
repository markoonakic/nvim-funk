local M = {}

function M.setup()
  local group = vim.api.nvim_create_augroup("nvim_funk_markdown", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "markdown", "rmd" },
    callback = function()
      vim.wo.wrap = true
      vim.wo.linebreak = true
    end,
  })
end

return M
