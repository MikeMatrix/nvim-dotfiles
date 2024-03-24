require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Resets
unmap("n", "<leader>v") -- Vertical Terminal
unmap("n", "<leader>h") -- Horizontal Terminal
unmap({ "n", "t" }, "<A-v>") -- Vertical Terminal
unmap({ "n", "t" }, "<A-h>") -- Horizontal Terminal
unmap("i", "<C-h>") -- Insert left
unmap("i", "<C-j>") -- Insert down
unmap("i", "<C-k>") -- Insert up
unmap("i", "<C-l>") -- Insert right
unmap("n", "<leader>th") -- theme picker
unmap("n", "<tab>") -- tabbufbar switch
unmap("n", "<S-tab>") -- tabbufbar switch
unmap("n", "<leader>x") -- tabbufbar close

-- General

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>o", "m`o<Esc>``", { desc = "Empty Line below" })
map("n", "<leader>O", "m`O<Esc>``", { desc = "Empty Line above" })

-- LSP
map({ "n", "v" }, "<leader>ca", function()
  require("actions-preview").code_actions()
end, { desc = "LSP Code Actions" })

map({ "n", "v" }, "<leader>co", function()
  require("typescript-tools.api").organize_imports(false)
end, { desc = "LSP Organize Imports" })

map({ "n", "v" }, "<leader>cf", function()
  require("typescript-tools.api").fix_all(false)
end, { desc = "LSP Fix All" })

map({ "n", "v" }, "<leader>ci", function()
  require("typescript-tools.api").add_missing_imports(false)
end, { desc = "LSP Add missing imports" })

map("n", "<leader>RF", function()
  require("typescript-tools.api").rename_file(false)
end, { desc = "LSP TS Rename File" })

map("n", "gs", function()
  require("typescript-tools.api").go_to_source_definition(false)
end, { desc = "LSP TS go to source defintion" })

-- Telescope
map(
  { "n", "v" },
  "<leader>ds",
  "<cmd> Telescope lsp_document_symbols <CR>",
  { desc = "Telescope LSP Document Symbols" }
)
map({ "n", "v" }, "<leader>rf", "<cmd> Telescope lsp_references <CR>", { desc = "Telescope LSP Reference List" })
map({ "n", "v" }, "<leader>di", "<cmd> Telescope diagnostics <CR>", { desc = "Telescope LSP Diagnostics" })

-- Harpoon
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon Add file" })

map("n", "<leader>hb", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon Menu" })

map("n", "<leader>ta", "<cmd> Telescope harpoon marks <CR>", { desc = "Harpoon Quick Menu" })

map("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon File 1" })

map("n", "<leader>2", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon File 2" })

map("n", "<leader>3", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon File 3" })

map("n", "<leader>4", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon File 4" })

-- Leap
map({ "n", "x", "o" }, "s", "<Plug>(leap-forward)", { desc = "Leap Forward" })
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap Backward" })
map({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", { desc = "Leap From Window" })

-- Treesitter Context
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "TreesitterContext Go to Context", silent = true })
