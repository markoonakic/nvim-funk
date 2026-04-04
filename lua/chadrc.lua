---@type ChadrcConfig
return {
  base46 = {
    theme = "gruvbox",
    transparency = true,
    hl_add = {
      NvDashPluginStats = { fg = "#fb4934" },
      SnipeTitle = { fg = "#ebdbb2", bg = "NONE", bold = true },
    },
    hl_override = {},
    integrations = {},
    changed_themes = {},
  },

  ui = {
    cmp = {
      lspkind_text = true,
      style = "default",
    },
    telescope = { style = "borderless" },
    statusline = {
      enabled = true,
      theme = "default",
      separator_style = "default",
    },
    tabufline = {
      enabled = false,
    },
  },

  nvdash = {
    load_on_startup = #vim.api.nvim_list_uis() > 0,
    header = function()
      return require("dashboard.header").get()
    end,
    buttons = {
      { txt = " Find File", keys = "f", cmd = "lua require('fff').find_files()" },
      { txt = "󱎸 Live Grep", keys = "g", cmd = "lua require('fff').live_grep()" },
      { txt = "󰦛 Restore Session", keys = "r", cmd = "AutoSession restore" },
      { txt = " Pick Session", keys = "R", cmd = "AutoSession search" },
      { txt = " New File", keys = "n", cmd = "ene | startinsert" },
      { txt = " LazyGit", keys = "l", cmd = "lua Snacks.lazygit.open()" },
      { txt = "󰒲 Lazy", keys = "L", cmd = "Lazy" },
      { txt = " Mason", keys = "m", cmd = "Mason" },
      { txt = " Quit", keys = "q", cmd = "qa" },
      { txt = "─", hl = "NvDashPluginStats", no_gap = true, rep = true },
      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashPluginStats",
        no_gap = true,
        content = "fit",
      },
      { txt = "─", hl = "NvDashPluginStats", no_gap = true, rep = true },
    },
  },

  term = {
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid",
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
  },

  mason = { pkgs = {}, skip = {} },
}
