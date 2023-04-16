local plugins = {
  {
  "neovim/nvim-lspconfig",
   dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "golangci-lint",
        "typescript-language-server",
        "eslint-lsp",
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "make",
        "go",
        "json",
        "yaml",
        "html",
        "javascript",
        "typescript",
        "markdown",
      },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      local gs = require("plugins.configs.others").gitsigns
      gs.signs.add = { text = "│" }
      gs.signs.change = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" }
      gs.signs.delete = { text = "_" }
      gs.signs.topdelete = { text = "‾" }
      gs.signs.changedelete = { text = "" }
      gs.signs.untracked = { text = "|" }
      return gs
    end,
  },
}

return plugins
