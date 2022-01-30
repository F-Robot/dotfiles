local gitsigns = require('gitsigns')
local map = require('utils/utils').map

gitsigns.setup()

map('n', '<Space>p', '<Cmd>Gitsigns preview_hunk<CR>', { silent = true })
