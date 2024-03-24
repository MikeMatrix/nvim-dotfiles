local options = {
  backend = { "telescope" },
  diff = {
    algorithm = "patience",
    ignore_whitespace = true,
  },
  telescope = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.8,
      height = 0.7,
      prompt_position = "top",
      preview_cutoff = 20,
      preview_height = function(_, _, max_lines)
        return max_lines - 15
      end,
    },
  },
}

return options
