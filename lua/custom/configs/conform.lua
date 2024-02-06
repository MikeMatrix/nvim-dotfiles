local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    c = { "clang_format" },
    cpp = { "clang_format" },

    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    graphql = { "prettierd" },
    json = { "prettierd" },

    php = { "pretty-php" },

    sh = { "shfmt" },

    rust = { "rustfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options) -- instead of the above code you could just use a loop!
