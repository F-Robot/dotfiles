local cmd = vim.cmd
-- General
require('settings')
require('commands')

-- Mapping
require('mappings.normal')
require('mappings.terminal')
require('mappings.command')

-- Plugins
require('plugins')
require('plugins.fzf')
require('plugins.cmp')
require('plugins.lsp')
require('plugins.tree')
require('plugins.indent')
require('plugins.luasnip')
require('plugins.comment')
require('plugins.gitsigns')
require('plugins.fugitive')
require('plugins.undotree')
require('plugins.autopairs')
require('plugins.bufferline')
require('plugins.treesitter')

cmd([[highlight PmenuSbar ctermbg=248 guibg=bg]]) -- Hide vertical split
cmd([[highlight Pmenu ctermfg=0 ctermbg=13 guifg=#c0caf5 guibg=bg]]) -- Hide vertical split
cmd([[highlight NvimTreeNormalNC guifg=#a9b1d6 guibg=bg]]) -- Hide vertical split
cmd([[highlight NvimTreeNormal guifg=#a9b1d6 guibg=bg]]) -- Hide vertical split
cmd([[highlight NormalFloat guifg=#c0caf5 guibg=bg]])
cmd([[highlight FloatBorder guifg=#3d59a1 guibg=bg]])
