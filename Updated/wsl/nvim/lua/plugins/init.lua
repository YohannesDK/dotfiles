return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- fjern kommentar for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      lazy = false,
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css",
        "c_sharp", "python" -- Sørger for highlighting
      },
      highlight = { enable = true },
    },
  },

  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Python
        "pyright",      -- LSP (Autofyll/Feilmeldinger)
        "ruff",         -- Linter & Formatter (Lynrask)
        "omnisharp",    -- LSP
        "csharpier",    -- Formatter
        -- Andre verktøy du hadde
        "xmlformatter",
        "stylua",
        "prettier",
        "json-lsp",
      },
    },
  },
}
