local M = {}

---@type Base46HLGroupsList
M.override = {
  LineNr = {
    fg = "light_grey",
  },
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
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
    bg = "#4d4f68",
  },
}

return M
