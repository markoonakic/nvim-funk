local yank_group = vim.api.nvim_create_augroup("nvim_funk_highlight_yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.hl.on_yank()
  end,
})
