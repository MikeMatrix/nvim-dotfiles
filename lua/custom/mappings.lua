---@type MappingsTable
local M = {
  disabled = {
    n = {
      ["<leader>h"] = "",
      ["<leader>v"] = "",
    },
    i = {
      ["<C-h>"] = "",
      ["<C-l>"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
    },
  },
  lspconfig = {
    n = {
      ["<leader>ca"] = {
        function()
          require("actions-preview").code_actions()
        end,
        "LSP code action",
      },
      ["<leader>co"] = {
        function()
          require("typescript-tools.api").organize_imports(false)
        end,
        "LSP organize imports",
      },
      ["<leader>cf"] = {
        function()
          require("typescript-tools.api").fix_all(false)
        end,
        "TSTools Fix All",
      },
      ["<leader>ci"] = {
        function()
          require("typescript-tools.api").add_missing_imports(false)
        end,
        "TSTools add missing imports",
      },
      ["<leader>RF"] = {
        function()
          require("typescript-tools.api").rename_file(false)
        end,
        "TSTools Rename File",
      },
      ["gs"] = {
        function()
          require("typescript-tools.api").go_to_source_definition(false)
        end,
        "TSTools go to source definition",
      },
      ["<leader>fm"] = {
        function()
          require("conform").format()
        end,
        "Conform Format",
      },
    },
    v = {
      ["<leader>ca"] = {
        function()
          require("actions-preview").code_actions()
        end,
        "LSP code action",
      },
    },
  },
  telescope = {
    n = {
      ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "LSP document symbols list" },
      ["<leader>rf"] = { "<cmd> Telescope lsp_references <CR>", "LSP referencesflist" },
      ["<leader>di"] = { "<cmd> Telescope diagnostics <CR>", "LSP Diagnostics" },
    },
  },
  general = {
    n = {
      ["<leader>tr"] = {
        function()
          require("base46").toggle_transparency()
        end,
        "Transparency toggle",
      },
      ["<leader>tb"] = {
        function()
          require("toggle-bool").toggle_bool()
        end,
        "Toggle Boolean",
      },
      ["<leader>o"] = {
        "m`o<Esc>``",
        "Insert new empty line below",
      },
      ["<leader>O"] = {
        "m`O<Esc>``",
        "Insert new empty line above",
      },
    },
  },
  harpoon = {
    n = {
      ["<leader>ha"] = {
        function()
          require("harpoon.mark").add_file()
        end,
        "Harpoon Add file",
      },
      ["<leader>ta"] = {
        "<cmd>Telescope harpoon marks<CR>",
        "Toggle quick menu",
      },
      ["<leader>hb"] = {
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        "Harpoon Menu",
      },
      ["<leader>1"] = {
        function()
          require("harpoon.ui").nav_file(1)
        end,
        "Navigate to file 1",
      },
      ["<leader>2"] = {
        function()
          require("harpoon.ui").nav_file(2)
        end,
        "Navigate to file 2",
      },
      ["<leader>3"] = {
        function()
          require("harpoon.ui").nav_file(3)
        end,
        "Navigate to file 3",
      },
      ["<leader>4"] = {
        function()
          require("harpoon.ui").nav_file(4)
        end,
        "Navigate to file 4",
      },
    },
  },
}

return M
