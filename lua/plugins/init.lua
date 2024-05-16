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
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
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
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = require "configs.nvim-tree",
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = require "configs.nvim-web-devicons",
    config = true,
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
    "jiaoshijie/undotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = require "configs.undotree",
    config = true,
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = { "Oil" },
    opts = require "configs.oil",
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
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup()
    end,
    event = "VeryLazy",
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "User FilePost",
  --   config = true,
  --   opts = require "configs.copilot",
  -- },
}
