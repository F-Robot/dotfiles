return require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')
  -- Colorschemes and Highlights
  use('folke/tokyonight.nvim')
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('theHamsta/nvim-treesitter-pairs')
  use('lukas-reineke/indent-blankline.nvim')
  use('norcalli/nvim-colorizer.lua')
  -- Filesystem
  use('ibhagwan/fzf-lua')
  use('nathom/filetype.nvim')
  -- Typing
  use('windwp/nvim-autopairs')
  use('tpope/vim-surround')
  use('numToStr/Comment.nvim')
  -- UI
  use('mbbill/undotree')
  use('kyazdani42/nvim-tree.lua')
  use({ 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' })
  -- Git
  use({ 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' })
  use('tpope/vim-fugitive')
  -- CMP
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-nvim-lsp')
  use('onsails/lspkind-nvim')
  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('rafamadriz/friendly-snippets')
  use('b0o/schemastore.nvim')
  -- LSP
  use('neovim/nvim-lspconfig')
  use('lukas-reineke/lsp-format.nvim')
  use('jose-elias-alvarez/null-ls.nvim')
  use('Pocco81/AutoSave.nvim')
end)
