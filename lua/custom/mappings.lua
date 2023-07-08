---@type MappingsTable
local M = {
  disabled = {
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
}

return M
