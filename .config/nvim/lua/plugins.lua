local utils = require('utils')

utils.init_lazy()

require('lazy').setup({
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    name = 'kanagawa',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    priority = 999,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
  },
  {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'onsails/lspkind.nvim',
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'mbbill/undotree',
      'akinsho/bufferline.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    'lewis6991/gitsigns.nvim',
    'echasnovski/mini.nvim',
    'windwp/nvim-ts-autotag',
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
    'b0o/schemastore.nvim',
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  },
  {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
  },
})

utils.set_schema('kanagawa')

require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.snippets')
require('plugins.tree')
require('colorizer').setup()
require('plugins.mini')
require('plugins.gitsigns')
require('plugins.bufferline')
require('plugins.telescope')
require('nvim-ts-autotag').setup()
