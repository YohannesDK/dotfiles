-- Pass NvChad defaults (on_attach, capabilities etc.) into the native system
require("nvchad.configs.lspconfig").defaults()

-- Native 0.11 way: vim.lsp.config per server
vim.lsp.config("pyright", {})
vim.lsp.config("omnisharp", {})
vim.lsp.config("html", {})
vim.lsp.config("cssls", {})

-- Enable them all
vim.lsp.enable({ "pyright", "omnisharp", "html", "cssls" })
