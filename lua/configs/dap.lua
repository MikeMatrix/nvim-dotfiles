local mason_registry = require "mason-registry"

local js_languages = {
  "typescript",
  "javascript",
  "javascriptreact",
  "typescriptreact",
}

local js_debug_adapter = mason_registry.get_package "js-debug-adapter"

require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = { "--inspect-brk=9229", "${port}" },
  },
}
