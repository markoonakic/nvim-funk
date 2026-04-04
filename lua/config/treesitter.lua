local M = {}

M.parsers = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "yaml",
  "toml",
  "bash",
  "go",
  "rust",
  "c",
  "cpp",
  "python",
  "regex",
}

local parser_set = {}
for _, parser in ipairs(M.parsers) do
  parser_set[parser] = true
end

local function enable_highlighting(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) or not vim.api.nvim_buf_is_loaded(bufnr) then
    return
  end

  if vim.bo[bufnr].buftype ~= "" then
    return
  end

  local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
  if not lang or not parser_set[lang] then
    return
  end

  pcall(vim.treesitter.start, bufnr, lang)
end

function M.setup()
  local ts = require("nvim-treesitter")

  ts.setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
  })

  vim.treesitter.language.register("json", "jsonc")

  local installed = ts.get_installed()
  local installed_set = {}
  for _, parser in ipairs(installed) do
    installed_set[parser] = true
  end

  local missing = {}
  for _, parser in ipairs(M.parsers) do
    if not installed_set[parser] then
      missing[#missing + 1] = parser
    end
  end

  if #missing > 0 then
    ts.install(missing, { summary = true })
  end

  local group = vim.api.nvim_create_augroup("nvim_funk_treesitter", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
      enable_highlighting(args.buf)
    end,
  })

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    enable_highlighting(buf)
  end
end

local function map_textobject_select(lhs, query, query_group)
  vim.keymap.set({ "x", "o" }, lhs, function()
    require("nvim-treesitter-textobjects.select").select_textobject(query, query_group or "textobjects")
  end, { desc = "Treesitter textobject " .. lhs })
end

local function map_textobject_move(modes, lhs, method, query, query_group)
  vim.keymap.set(modes, lhs, function()
    require("nvim-treesitter-textobjects.move")[method](query, query_group or "textobjects")
  end, { desc = "Treesitter move " .. lhs })
end

function M.setup_textobjects()
  require("nvim-treesitter-textobjects").setup({
    select = {
      lookahead = true,
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "V",
      },
      include_surrounding_whitespace = false,
    },
    move = {
      set_jumps = true,
    },
  })

  map_textobject_select("af", "@function.outer")
  map_textobject_select("if", "@function.inner")
  map_textobject_select("ac", "@class.outer")
  map_textobject_select("ic", "@class.inner")
  map_textobject_select("aa", "@parameter.outer")
  map_textobject_select("ia", "@parameter.inner")
  map_textobject_select("ab", "@block.outer")
  map_textobject_select("ib", "@block.inner")
  map_textobject_select("am", "@call.outer")
  map_textobject_select("im", "@call.inner")
  map_textobject_select("ad", "@comment.outer")
  map_textobject_select("ai", "@conditional.outer")
  map_textobject_select("ii", "@conditional.inner")
  map_textobject_select("al", "@loop.outer")
  map_textobject_select("il", "@loop.inner")

  map_textobject_move({ "n", "x", "o" }, "]f", "goto_next_start", "@function.outer")
  map_textobject_move({ "n", "x", "o" }, "]F", "goto_next_end", "@function.outer")
  map_textobject_move({ "n", "x", "o" }, "[f", "goto_previous_start", "@function.outer")
  map_textobject_move({ "n", "x", "o" }, "[F", "goto_previous_end", "@function.outer")
  map_textobject_move({ "n", "x", "o" }, "]c", "goto_next_start", "@class.outer")
  map_textobject_move({ "n", "x", "o" }, "]C", "goto_next_end", "@class.outer")
  map_textobject_move({ "n", "x", "o" }, "[c", "goto_previous_start", "@class.outer")
  map_textobject_move({ "n", "x", "o" }, "[C", "goto_previous_end", "@class.outer")
end

return M
