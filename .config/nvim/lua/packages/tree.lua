local nvim_tree = require('nvim-tree')
local map = require('utils/utils').map
local g = vim.g
local cmd = vim.cmd

g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
}

-- Customize icons.
g.nvim_tree_icons = {
  git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = '',
    deleted = '',
    untracked = '',
    ignored = '',
  },
}

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
map('n', '<Space>f', '<Cmd>NvimTreeToggle<CR>', { silent = true })
map('n', '<Space>F', '<Cmd>NvimTreeFindFile<CR>z.', { silent = true })
