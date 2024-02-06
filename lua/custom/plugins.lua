---@type NvPluginSpec[]
local plugins = {
  -- package managers
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.mason",
  },
  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "pmizio/typescript-tools.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = require "custom.configs.treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    opts = require "custom.configs.treesitter-context",
    config = true,
  },
  {
    "nvim-treesitter/playground",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "TSPlaygroundToggle",
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
    config = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    init = function() end,
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          -- NOTE: Check out this for guide
          -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
          local dap = require "dap"
          vim.fn.sign_define("DapBreakpoint", { text = "?", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

          local dapui = require "dapui"
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end

          -- dap.listeners.before.event_terminated["dapui_config"] = function()
          --   dapui.close()
          -- end

          -- dap.listeners.before.event_exited["dapui_config"] = function()
          --   dapui.close()
          -- end

          -- NOTE: Make sure to install the needed files/exectubles through mason
          require "custom.configs.dap.settings.js-debug"
        end,
      },
    },
    opts = require "custom.configs.dap.ui",
  },
  -- integrations
  -- {
  --   "willothy/wezterm.nvim",
  --   config = true,
  -- },
  -- UI
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
    "aznhe21/actions-preview.nvim",
    keys = {
      { "<leader>ca", mode = "n", desc = "Code Action" },
      { "<leader>ca", mode = "v", desc = "Code Action (visual mode)" },
    },
    opts = require "custom.configs.actions-preview",
    config = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  -- editor
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
    "jeffkreeftmeijer/vim-numbertoggle",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = require "custom.configs.surround",
    config = true,
  },
  -- {
  --   "gerazov/toggle-bool.nvim",
  --   lazy = false,
  --   opts = require "custom.configs.toggle-bool",
  --   config = function(_, opts)
  --     local toggleBool = require "toggle-bool"
  --     toggleBool.conf.toggles = vim.tbl_extend("force", toggleBool.conf.toggles, opts.additional_toggles)
  --   end,
  -- },
}

return plugins
