local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust" },
    root_dir = util.root_pattern "Cargo.toml",
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
}

return options
