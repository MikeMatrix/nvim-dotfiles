return {
  -- Package Managers
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
  },
  -- lsp
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = require "configs.treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = require "configs.treesitter-context",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/playground",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "TSPlaygroundToggle",
  },
  -- ui
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
  },
  {
    "natecraddock/telescope-zf-native.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/harpoon",
    cmd = "Harpoon",
    lazy = false,
  },
  {
    "aznhe21/actions-preview.nvim",
    keys = {
      { "<leader>ca", mode = "n", desc = "Code Action" },
      { "<leader>ca", mode = "v", desc = "Code Action (visual mode)" },
    },
    opts = require "configs.actions-preview",
    config = true,
  },
  -- editor
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = require "configs.surround",
    config = true,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
  },
}
