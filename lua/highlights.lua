local M = {}

---@type Base46HLGroupsList
M.override = {
  LineNr = {
    fg = "nord_blue",
  },
  CursorLineNr = {
    fg = "vibrant_green",
  },
  CursorLine = {
    bg = "one_bg",
  },
  Comment = {
    fg = "light_grey",
    italic = true,
  },
  Folded = {
    fg = "light_grey",
    bold = true,
  },
  NonText = {
    fg = "light_grey",
    italic = true,
  },
  -- Nvim-tree
  NvimTreeCursorLine = {
    bg = "one_bg",
  },
}

---@type HLTable
M.add = {
  LspInlayHint = {
    fg = "light_grey",
    bg = "one_bg2",
    italic = true,
  },
  -- Leap
  LeapMatch = {
    fg = "pink",
    underline = true,
    nocombine = true,
    bold = true,
  },
  LeapLabelPrimary = {
    fg = "black",
    bg = "cyan",
    bold = true,
    nocombine = true,
  },
  LeapLabelSecondary = {
    fg = "black",
    bg = "cyan",
    bold = true,
    nocombine = true,
  },
  LeapBackdrop = {
    bg = "lightbg",
  },
  -- TreesitterContext
  TreesitterContext = {
    bg = "one_bg",
  },
  TreesitterContextLineNumber = {
    fg = "light_grey",
  },
}

return M
