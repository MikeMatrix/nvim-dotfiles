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
      ["<leader>co"] = { "<cmd>OrganizeImports <CR>", "LSP organize imports" },
    },
  },
  telescope = {
    n = {
      ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "LSP document symbols list" },
      ["<leader>rf"] = { "<cmd> Telescope lsp_references <CR>", "LSP referencesflist" },
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
