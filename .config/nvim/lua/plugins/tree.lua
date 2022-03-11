local nvim_tree = require('nvim-tree')
local map = require('utils/utils').map
local g = vim.g
local cmd = vim.cmd

-- Enable indent markers.
g.nvim_tree_indent_markers = 1

-- Enable group empty
g.nvim_tree_group_empty = 1

nvim_tree.setup({
  hijack_cursor = true,
  auto_close = true,
  git = {
    enable = false,
  },
  view = {
    width = 20,
    hide_root_folder = true,
  },
})

cmd('highlight! NvimTreeNormal guibg=NONE')
-- Nvim Tree
map('n', '<space>t', '<Cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<space>r', '<Cmd>NvimTreeRefresh<CR>', { silent = true })
map('n', '<space>T', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })
