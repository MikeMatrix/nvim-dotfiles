local baseIcons = require "nvchad.icons.devicons"

local options = {
  override = {
    [".prettierrc"] = {
      icon = "󰉽",
      name = "PrettierConfig",
    },
  },
}

options.override = vim.tbl_deep_extend("force", baseIcons, options.override)

return options
