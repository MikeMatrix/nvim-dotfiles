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
  changed_themes = {
    catppuccin = {
      base_16 = {
        base02 = "#4d4f68",
      },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
