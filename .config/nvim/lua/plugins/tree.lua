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
  auto_close = true,
  git = {
    enable = false,
  },
  view = {
    width = 23,
    signcolumn = 'yes',
    hide_root_folder = true,
    preserve_window_proportions = true,
  },
  open_file = {
    quit_on_open = true
  }
})

-- Nvim Tree
map('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>T', '<Cmd>NvimTreeRefresh<CR>', { silent = true })
