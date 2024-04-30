-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",
  changed_themes = {
    catppuccin = {
      base_16 = {
        base02 = "#4d4f68",
      },
    },
  },
  transparency = false,
  tabufline = {
    enabled = false,
  },
  statusline = {},
  hl_override = require("highlights").override,
  hl_add = require("highlights").add,
}

return M
