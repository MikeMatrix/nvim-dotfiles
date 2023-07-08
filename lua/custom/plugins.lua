---@type NvPluginSpec[]
local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    opts = require "custom.configs.guess-indent",
    config = function(_, opts)
      require("guess-indent").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.treesitter",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.nvim-tree",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "custom.configs.telescope",
  },
  {
    "natecraddock/telescope-zf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = require "custom.configs.surround",
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },
}

return plugins
