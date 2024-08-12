local themes = require "telescope.themes"

local opts = {
  telescope = themes.get_cursor {
    -- sorting_strategy = "ascending",
    -- layout_strategy = "vertical",
    layout_config = {
      width = 300,
      height = 20,
      -- prompt_position = "top",
      -- preview_cutoff = 20,
      -- preview_height = function(_, _, max_lines)
      --   return max_lines - 15
      -- end,
    },
  },
}

return opts
