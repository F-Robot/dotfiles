local map = require('utils/utils').map

require('luasnip.loaders.from_vscode').lazy_load()

map('i', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map('i', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
map('s', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map('s', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
