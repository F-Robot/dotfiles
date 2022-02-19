---@diagnostic disable: different-requires
local cmd = vim.cmd

cmd('source ~/.config/nvim/lua/autocmds.vim')
cmd('source ~/.config/nvim/lua/packages/grepcommand.vim')

-- This Plugins needs required before others
-- Icons and Colorscheme
require('packages.devicons')
require('packages.nightfox')

-- General

require('settings')
require('commands')
require('plugins')

-- Mapping
require('mappings.normal')
require('mappings.insert')
require('mappings.terminal')
require('mappings.command')
require('mappings.operator')

-- Highlight
require('packages.treesitter')
require('packages.indent')

-- Filesystem
require('packages.fzf')

-- UI Components
require('packages.tree')
require('packages.undotree')
require('packages.bufferline')

-- Typing
require('packages.autopairs')
require('packages.luasnip')
require('packages.cmp')

-- Git
require('packages.fugitive')
require('packages.diffview')
require('packages.gitsigns')

-- LSP
require('packages.lsp')
