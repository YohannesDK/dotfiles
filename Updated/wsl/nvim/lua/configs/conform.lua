local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    cs = { "csharpier" },
    html = { "prettier" },
    css = { "prettier" },
  },
}

return options
