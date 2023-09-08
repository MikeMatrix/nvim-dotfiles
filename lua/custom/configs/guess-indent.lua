local options = {
  auto_cmd = true,
  override_editorconfig = true,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = {
    "help",
    "nofile",
    "terminal",
    "prompt",
  },
}

return options
