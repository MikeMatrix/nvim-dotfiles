local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "clangd",
  -- "graphql",
  -- "tsserver",
  "intelephense",
  "jsonls",
  "yamlls",
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

vim.g.inlay_hints_visible = true
require("typescript-tools").setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      local inlay_hints_group = vim.api.nvim_create_augroup("InlayHints", { clear = true })

      -- Initial inlay hint display.
      local mode = vim.api.nvim_get_mode().mode
      vim.lsp.inlay_hint.enable(bufnr, mode == "n" or mode == "v")

      vim.api.nvim_create_autocmd("InsertEnter", {
        group = inlay_hints_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.inlay_hint.enable(bufnr, false)
        end,
      })
      vim.api.nvim_create_autocmd("InsertLeave", {
        group = inlay_hints_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.inlay_hint.enable(bufnr, true)
        end,
      })
    end
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "none",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionLikeReturnTypeHints = false,
      includeCompletionsForModuleExports = true,
      quotePreference = "auto",
    },
  },
}
