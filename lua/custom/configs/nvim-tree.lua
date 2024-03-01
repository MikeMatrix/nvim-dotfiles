local options = {
  git = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  view = {
    width = {
      min = 30,
      max = 100,
      padding = 1,
    },
  },
}

return options
