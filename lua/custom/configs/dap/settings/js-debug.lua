local dap = require "dap"

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    -- ?? Make sure to update this path to point to your installation
    args = { "${port}" },
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "node",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    pid = require("dap.utils").pick_process,
  },
}

dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "node",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    pid = require("dap.utils").pick_process,
  },
}
