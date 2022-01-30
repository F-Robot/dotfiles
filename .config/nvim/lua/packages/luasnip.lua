local map = require('utils/utils').map
local friendlySnippets = {
  'javascriptreact',
  'javascript',
  'python',
  'django',
  'html',
  'css',
  'sass',
}

require('luasnip.loaders.from_vscode').load({ include = friendlySnippets })
require('luasnip').filetype_extend('python', { 'django' })

map('i', '<C-k>', '<Plug>luasnip-jump-prev', { noremap = false })
map('i', '<C-j>', '<Plug>luasnip-expand-or-jump', { noremap = false })
map('s', '<C-k>', '<Plug>luasnip-jump-prev', { noremap = false })
map('s', '<C-j>', '<Plug>luasnip-expand-or-jump', { noremap = false })
