local options = {
  extensions = {
    ["zf-native"] = {
      file = {
        enable = true,
        highlight_results = true,
        match_filename = true,
      },
      generic = {
        enable = true,
        highlight_results = true,
        match_filename = false,
      },
    },
  },
  extensions_list = {
    "themes",
    "terms",
    "zf-native",
    "harpoon",
  },
}

return options
