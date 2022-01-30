local map = require('utils/utils').map
local diffview = require('diffview')

diffview.setup({
  file_panel = {
    position = 'bottom',
    height = 10,
    listing_style = 'tree',
    tree_options = {
      flatten_dirs = false,
      folder_statuses = 'only_folded',
    },
  },
})

map('n', '<Space>d', '<Cmd>DiffviewOpen<CR>', { silent = true })
map('n', '<Space>h', '<Cmd>DiffviewFileHistory<CR>', { silent = true })

-- TODO: Add generic tab mappings and replace this with :tabclose.
map('n', '<Space>q', '<Cmd>DiffviewClose<CR>', { silent = true })
