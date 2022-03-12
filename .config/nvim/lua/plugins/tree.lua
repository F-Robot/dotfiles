local nvim_tree = require('nvim-tree')
local map = require('utils/utils').map
local g = vim.g
local cmd = vim.cmd

-- Enable indent markers.
g.nvim_tree_indent_markers = 1

-- Enable group empty
g.nvim_tree_group_empty = 1

nvim_tree.setup({
  disable_netrw = true,
  hijack_cursor = true,
  auto_close = true,
  git = {
    enable = false,
  },
  view = {
    width = 25,
    signcolumn = 'no',
    hide_root_folder = true,
  },
  open_file = {
    quit_on_open = true
  }
})

cmd('highlight! NvimTreeNormal guibg=NONE')
-- Nvim Tree
map('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>', { silent = true })
map('n', '<leader>T', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })
