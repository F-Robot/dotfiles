local gitsigns = require('gitsigns')
local map = require('utils/utils').map

gitsigns.setup({})

map('n', '<space>p', '<Cmd>Gitsigns preview_hunk<CR>', { silent = true })
map('n', ']c', '<Cmd>Gitsigns next_hunk<CR>', { silent = true })
map('n', '[c', '<Cmd>Gitsigns prev_hunk<CR>', { silent = true })
