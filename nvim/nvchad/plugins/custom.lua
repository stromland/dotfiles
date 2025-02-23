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
      require "custom.configs.lspconfig"
   end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local nt = require "nvchad.configs.nvimtree"
      nt.view.adaptive_size = true
      nt.renderer.icons.glyphs.folder.default = ""
      nt.renderer.icons.show = {
        git = false
      }
      return nt
    end,
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
        "css",
        "javascript",
        "typescript",
        "markdown",
      },
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      local gs = require "nvchad.configs.gitsigns"
      gs.signs.add = { text = "│" }
      -- gs.signs.change = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" }
      gs.signs.delete = { text = "_" }
      gs.signs.topdelete = { text = "‾" }
      gs.signs.changedelete = { text = "" }
      gs.signs.untracked = { text = "│" }
      return gs
    end,
  },
}

return plugins
