require "nvchad.options"

local uv = vim.uv or vim.loop

-- WSL Specific
local in_wsl = os.getenv "WSL_DISTRO_NAME" ~= nil
local in_windows = uv.os_uname().sysname == "Windows_NT"

if in_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = false,
  }
else
  if in_windows then
    vim.g.clipboard = {
      name = "win32yank-windows",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --crlf",
        ["*"] = "win32yank.exe -o --crlf",
      },
      cache_enabled = false,
    }
  end
end

-- Neovide Specific
if vim.g.neovide then
  vim.opt.guifont = "FiraCode Nerd Font:h9"
  vim.opt.guifontwide = "FiraCode Nerd Font:h9"
end

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
