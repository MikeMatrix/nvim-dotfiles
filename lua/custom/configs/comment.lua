local options = {
  toggler = {
    ---Line-comment toggle keymap
    line = "<leader>gcc",
    ---Block-comment toggle keymap
    block = "<leader>gbc",
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = "<leader>gc",
    ---Block-comment keymap
    block = "<leader>gb",
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = "<leader>gcO",
    ---Add comment on the line below
    below = "<leader>gco",
    ---Add comment at the end of line
    eol = "<leader>gcA",
  },
}

return options
