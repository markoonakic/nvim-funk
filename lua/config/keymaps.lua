local opts = { noremap = true, silent = true }

vim.keymap.set("n", "B", "^")
vim.keymap.set("n", "E", "$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking replaced text" })
vim.keymap.set("v", "p", '"_dp', opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute word under cursor" }
)

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tab split<CR>", { desc = "Current buffer in new tab" })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
vim.keymap.set("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "Theme switcher" })

vim.keymap.set("n", "<leader>x", function()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    vim.notify("No file associated with the current buffer", vim.log.levels.WARN)
    return
  end

  vim.fn.system({ "chmod", "+x", path })
  if vim.v.shell_error ~= 0 then
    vim.notify("Failed to make file executable: " .. vim.fn.fnamemodify(path, ":~"), vim.log.levels.ERROR)
    return
  end

  vim.notify("Made executable: " .. vim.fn.fnamemodify(path, ":~"))
end, { desc = "Make current file executable" })

vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:~")
  if path == "" then
    vim.notify("No file associated with the current buffer", vim.log.levels.WARN)
    return
  end

  vim.fn.setreg("+", path)
  vim.notify("Copied file path: " .. path)
end, { desc = "Copy file path" })

vim.keymap.set({ "n", "t" }, "<A-t>", function()
  Snacks.terminal.toggle(nil, {
    win = { style = "terminal_float" },
  })
end, { desc = "Toggle floating terminal" })

vim.keymap.set({ "n", "t" }, "<leader>lg", function()
  Snacks.lazygit.open()
end, { desc = "Open LazyGit" })

vim.keymap.set({ "n", "t" }, "<leader>ll", function()
  Snacks.lazygit.log()
end, { desc = "Open LazyGit log" })
