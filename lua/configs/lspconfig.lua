local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "graphql",
}

local per_server_config = {
  graphql = {
    filetypes = { "graphql" },
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }

  if per_server_config[lsp] ~= nil then
    config = vim.tbl_extend("force", config, per_server_config[lsp])
  end

  lspconfig[lsp].setup(config)
end

-- typescript
require("typescript-tools").setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    quotePreference = "auto",
  },
}
