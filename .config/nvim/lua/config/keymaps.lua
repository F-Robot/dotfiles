-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "v" }, "gf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

map("n", "J", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Add [count] blank lines above or below the cursor.
map("n", "[<space>", "<cmd>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<cr>", { silent = true })
map("n", "]<space>", "<cmd>put =repeat(nr2char(10), v:count1) <Bar> '[-1<cr>", { silent = true })

-- Move in command mode
map("c", "<C-j>", "<Down>")
map("c", "<C-k>", "<Up>")
map("c", "<C-h>", "<Left>")
map("c", "<C-l>", "<Right>")

map("c", "<C-g>", "<S-Left>")
map("c", "<C-;>", "<S-Right>")
