-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local map = vim.keymap.set

vim.g.mapleader = ","

map("n", "J", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

map({ "n", "v" }, "gf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })
