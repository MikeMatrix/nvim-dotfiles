---@type ChadrcConfig
local M = {}

M.options = {
  nvchad_branch = "main",
}

M.ui = {
  theme = "catppuccin",
  transparency = true,

  nvdash = {
    load_on_startup = true,
    header = {
      " ██████╗██╗  ██╗ █████╗ ██████╗ ████████╗██████╗ ██╗██╗  ██╗",
      "██╔════╝██║  ██║██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║╚██╗██╔╝",
      "██║     ███████║███████║██║  ██║   ██║   ██████╔╝██║ ╚███╔╝ ",
      "██║     ██╔══██║██╔══██║██║  ██║   ██║   ██╔══██╗██║ ██╔██╗ ",
      "╚██████╗██║  ██║██║  ██║██████╔╝   ██║   ██║  ██║██║██╔╝ ██╗",
      " ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝",
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
