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
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      local leap = require "leap"
      leap.add_default_mappings()
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
    "numToStr/Comment.nvim",
    keys = {
      { "<leader>gcc", mode = "n", desc = "Comment toggle current line" },
      { "<leader>gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "<leader>gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "<leader>gbc", mode = "n", desc = "Comment toggle current block" },
      { "<leader>gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "<leader>gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    opts = require "custom.configs.comment",
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
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    opts = require "custom.configs.treesitter-context",
    config = function(_, opts)
      require("treesitter-context").setup(opts)
    end,
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
    "ThePrimeagen/harpoon",
    cmd = "Harpoon",
    lazy = false,
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
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "rust",
    opts = require "custom.configs.rust-tools",
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
}

return plugins
