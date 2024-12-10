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
    "williamboman/mason-lspconfig.nvim",
    commands = { "LspInstall", "LspUninstall" },
    event = "User FilePost",
    opts = require "configs.lspconfig-mason",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.lsp").diagnostic_config()
    end,
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  -- },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
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
  -- dap
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    lazy = false,
    opts = {
      ensure_installed = {
        "js",
      },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
    config = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    lazy = false,
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
    branch = "harpoon2",
    cmd = "Harpoon",
    lazy = false,
    config = true,
  },
  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = function()
      require("telescope").load_extension "git_worktree"
      local Hooks = require "git-worktree.hooks"
      Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = require "configs.actions-preview",
    config = true,
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
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
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
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   config = function()
  --     require("rainbow-delimiters.setup").setup()
  --   end,
  --   event = "VeryLazy",
  -- },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup {
  --       keymaps = {
  --         accept_suggestion = "<C-y>",
  --         clear_suggestion = "<A-n>",
  --         accept_word = "<A-h>",
  --       },
  --     }
  --   end,
  --   lazy = false,
  -- },
}
