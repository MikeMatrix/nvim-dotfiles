local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "clangd",
  -- "graphql",
  "tsserver",
}

local additionals = {
  tsserver = {
    on_attach = function(client, bufnr)
      vim.api.nvim_create_user_command("OrganizeImports", function()
        vim.lsp.buf.execute_command {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
      end, { desc = "TypeScript Organize Imports" })
      on_attach(client, bufnr)
    end,
    single_file_support = false,
  },
  graphql = {
    filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
  },
}

for _, lsp in pairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if additionals[lsp] ~= nil then
    config = vim.tbl_deep_extend("force", config, additionals[lsp])
  end

  lspconfig[lsp].setup(config)
end
