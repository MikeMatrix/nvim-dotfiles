---@type MappingsTable
local M = {
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
}

return M
