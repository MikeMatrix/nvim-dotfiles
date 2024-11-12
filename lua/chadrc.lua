-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",
  transparency = true,
  tabufline = {
    enabled = false,
  },

  hl_override = require("highlights").override,
  hl_add = require("highlights").add,
  mason = {
    pkgs = {
      -- lua
      "lua-language-server",
      "stylua",
      -- web
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "graphql-language-service-cli",
      "deno",
      "prettier",
      "prettierd",
      -- c/cpp
      "clangd",
      "clang-format",
      -- rust
      "rust-analyzer",
      -- php
      "intelephense",
    },
  },
}

return M
