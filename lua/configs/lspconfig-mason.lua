local map = vim.keymap.set

local function on_attach(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

  map({ "n", "v" }, "<leader>ca", require("actions-preview").code_actions, opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")

  map("n", "<leader>l", function()
    vim.diagnostic.open_float()
  end, opts "Open Diagnostics Float")
end

local function on_init(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local config = {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "clangd",
    "vtsls",
    "tailwindcss",
    "jsonls",
    "graphql",
    "omnisharp",
    "rust_analyzer",
    "dockerls",
    "docker_compose_language_service",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init,
      }
    end,
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init,

        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                "${3rd}/luv/library",
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      }
    end,
    ["graphql"] = function()
      require("lspconfig").graphql.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init,

        filetypes = { "graphql" },
      }
    end,
    ["omnisharp"] = function()
      require("lspconfig").omnisharp.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        on_init = on_init,

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
      }
    end,
    ["vtsls"] = function()
      local opts = {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)

          local function opts(desc)
            return { buffer = bufnr, desc = "LSP " .. desc }
          end

          map({ "n", "v" }, "<leader>co", function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { "source.organizeImports" },
                diagnostics = {},
              },
            }
          end, opts "Organize Imports")

          map({ "n", "v" }, "<leader>ci", function()
            vim.lsp.buf.code_action {
              apply = true,
              context = {
                only = { "source.addMissingImports.ts" },
                diagnostics = {},
              },
            }
          end, opts "Add missing Imports")

          map({ "n", "v" }, "<leader>gS", function()
            local params = vim.lsp.util.make_position_params(0, "utf-8")
            require("trouble").open {
              mode = "lsp_command",
              params = {
                command = "typescript.goToSourceDefinition",
                arguments = { params.textDocument.uri, params.position },
              },
            }
          end, opts "Go To Source Definition")

          if client.supports_method "textDocument/inlayHint" or client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end,
        on_init = on_init,
        capabilities = capabilities,
        settings = {
          quotePreference = "auto",
          complete_function_calls = true,
          jsx_close_tag = {
            enable = true,
            filetypes = { "javascriptreact", "typescriptreact" },
          },
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = false },
              parameterNames = { enabled = false },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      }

      -- copy typescript settings to javascript
      opts.settings.javascript =
        vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})

      require("lspconfig").vtsls.setup(opts)
    end,
  },
}

return config
