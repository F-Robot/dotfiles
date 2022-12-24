local map = require("utils/utils").map

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "/home/ricardo/.config/nvim/vue-vscode-snippets/" },
})

map("i", "<C-k>", '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map("i", "<C-j>", '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
map("s", "<C-k>", '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map("s", "<C-j>", '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
