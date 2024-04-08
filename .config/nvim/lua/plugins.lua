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
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'onsails/lspkind.nvim',
  },
  {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jay-babu/mason-null-ls.nvim',
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
    'b0o/schemastore.nvim',
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
      'saadparwaiz1/cmp_luasnip',
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
    version = 'v2.*',
    build = 'make install_jsregexp',
  },
  {
    'rafamadriz/friendly-snippets',
    'lewis6991/gitsigns.nvim',
    'RRethy/vim-illuminate',
    'mbbill/undotree',
  },
})

require('kanagawa').setup({
  transparent = true,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = 'none',
        },
      },
    },
  },
})
utils.set_schema('kanagawa')

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
