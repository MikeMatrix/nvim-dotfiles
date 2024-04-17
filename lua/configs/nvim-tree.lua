local baseOptions = require "nvchad.configs.nvimtree"

local options = {
  view = {
    width = {
      min = 30,
      max = 100,
      padding = 1,
    },
  },
}

return vim.tbl_deep_extend("force", baseOptions, options)
