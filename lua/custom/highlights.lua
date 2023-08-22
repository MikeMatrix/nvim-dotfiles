local M = {}

---@type Base46HLGroupsList
M.override = {
  LineNr = {
    fg = "nord_blue",
  },
  CursorLineNr = {
    fg = "vibrant_green",
  },
  Comment = {
    italic = true,
  },
  -- Nvim-tree
  NvimTreeCursorLine = {
    bg = "one_bg",
  },
}

---@type HLTable
M.add = {
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
