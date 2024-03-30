local utils = require('utils')

utils.init_lazy()

require('lazy').setup({
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    name = 'kanagawa',
    config = function()
      utils.set_schema('kanagawa')
    end,
  },
  {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'onsails/lspkind.nvim',
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvimtools/none-ls.nvim',
    },
  },
  { 'echasnovski/mini.nvim', version = false },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-notify',
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'VeryLazy' },
    init = utils.init_treesitter,
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
    },
  },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = utils.init_startuptime,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = { enable_autocmd = false },
  },
  {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'lewis6991/gitsigns.nvim',
    'RRethy/vim-illuminate',
    'mbbill/undotree'
  },
})

require('plugins.lsp')
require('plugins.tree')
require('plugins.cmp')
require('plugins.snippets')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.mini')
require('plugins.noice')
require('plugins.indent')
require('plugins.gitsigns')
require('plugins.bufferline')
