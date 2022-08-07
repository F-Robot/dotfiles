local tree = require('nvim-tree')
local map = require('utils/utils').map

tree.setup()

map('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>', { silent = true })
