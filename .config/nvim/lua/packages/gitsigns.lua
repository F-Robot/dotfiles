local gitsigns = require('gitsigns')
local map = require('utils/utils').map

gitsigns.setup()

map('n', '<Space>p', '<Cmd>Gitsigns preview_hunk<CR>', { silent = true })
map('n', '<Space>n', '<Cmd>Gitsigns next_hunk<CR>', { silent = true })
map('n', '<Space>v', '<Cmd>Gitsigns prev_hunk<CR>', { silent = true })
