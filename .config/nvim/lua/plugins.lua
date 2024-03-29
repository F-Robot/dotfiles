require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')
  use('williamboman/mason.nvim')
  -- Colorscheme
  use('folke/tokyonight.nvim')
  use('NvChad/nvim-colorizer.lua')
  use('lukas-reineke/indent-blankline.nvim')
  use({ 'catppuccin/nvim', as = 'catppuccin' })
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  -- Filesystem
  use('ibhagwan/fzf-lua')
  use('nvim-tree/nvim-web-devicons')
  -- Typing
  use('windwp/nvim-autopairs')
  use('numToStr/Comment.nvim')
  use('kylechui/nvim-surround')
  -- Git
  use('nvim-lua/plenary.nvim')
  use('lewis6991/gitsigns.nvim')
  use('tpope/vim-fugitive')
  -- UI
  use('mbbill/undotree')
  use('nvim-tree/nvim-tree.lua')
  use({ 'akinsho/bufferline.nvim', tag = 'v3.*' })
  -- CMP
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-cmdline')
  use('onsails/lspkind-nvim')
  use('jose-elias-alvarez/nvim-lsp-ts-utils')
  use('hrsh7th/cmp-nvim-lsp-signature-help')
  use({ 'hrsh7th/cmp-nvim-lsp', requires = 'onsails/lspkind-nvim' })
  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('b0o/schemastore.nvim')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')
  -- LSP
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('jose-elias-alvarez/typescript.nvim')

  use('williamboman/mason.nvim')
  use('nvimtools/none-ls.nvim')
  use('jay-babu/mason-null-ls.nvim')
  
end)

require('plugins.colorscheme')
require('plugins.treesitter')
require('plugins.bufferline')
require('plugins.autopairs')
require('plugins.colorizer')
require('plugins.blankline')
require('plugins.surround')
require('plugins.gitsigns')
require('plugins.undotree')
require('plugins.luasnip')
require('plugins.comment')
require('plugins.tree')
require('plugins.fzf')
require('plugins.cmp')
require('plugins.lsp')
require('plugins.git')
require('plugins.typescript')

require("mason").setup()
require("mason-null-ls").setup({
    handlers = {},
})
