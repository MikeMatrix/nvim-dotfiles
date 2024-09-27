local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local map = vim.keymap.set
local unmap = vim.keymap.del

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  unmap({ "n", "v" }, "<leader>ca", { buffer = bufnr })
  map({ "n", "v" }, "<leader>ca", function()
    require("actions-preview").code_actions()
  end, { buffer = bufnr, desc = "LSP Code Actions" })
end

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "graphql",
  "tailwindcss",
  "jsonls",
  -- "sqls",
  "omnisharp",
  "rust_analyzer",
}

local per_server_config = {
  graphql = {
    filetypes = { "graphql" },
  },
  omnisharp = {
    cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
    handlers = {
      ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
      ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
      ["textDocument/references"] = require("omnisharp_extended").references_handler,
      ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
    },
    enable_import_completion = true,
    organize_imports_on_format = true,
    enable_roslyn_analyzers = true,
  },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  local config = {
    on_attach = custom_on_attach,
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
  on_attach = custom_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    quotePreference = "auto",
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
    vtsls = {
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
  },
}
