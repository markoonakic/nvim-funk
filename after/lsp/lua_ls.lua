return {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim", "Snacks" },
      },
      hint = {
        enable = true,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
