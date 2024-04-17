local options = {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 100,
    keymap = {
      accept = "<C-y>",
      accept_word = "<A-h>",
      accept_line = "<A-y>",
      next = "<A-]>",
      prev = "<A-]>",
      dismiss = "<A-n>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    typescript = true,
    typescriptreact = true,
    javascript = true,
    javascriptreact = true,
  },
}

return options
