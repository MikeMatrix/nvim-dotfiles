local highlights = require "custom.highlights"

---@type ChadrcConfig
local M = {}

M.options = {
  nvchad_branch = "main",
}

M.ui = {
  theme = "catppuccin",
  changed_themes = {
    catppuccin = {
      base_16 = {
        base02 = "#4d4f68",
      },
    },
  },
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
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
