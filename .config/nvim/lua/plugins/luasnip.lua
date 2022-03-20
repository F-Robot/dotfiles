local map = require('utils/utils').map

require('luasnip.loaders.from_vscode').load()

map('i', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map('i', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
map('s', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map('s', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
-- s  <Plug>luasnip-jump-prev * <Cmd>lua require'luasnip'.jump(-1)<CR>
-- s  <Plug>luasnip-jump-next * <Cmd>lua require'luasnip'.jump(1)<CR>
