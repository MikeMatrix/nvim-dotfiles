local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "graphql",
}

local additionals = {
  tsserver = {
    commands = {
      OrganizeImports = {
        function()
          vim.lsp.buf.execute_command {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
            title = "",
          }
        end,
        description = "TypeScript Organize Imports",
      },
    },
    single_file_support = false,
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
