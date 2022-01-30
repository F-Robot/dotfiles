---@diagnostic disable: undefined-global
return require('packer').startup(function()
  -- Filesystem
  use('wbthomason/packer.nvim')
  use('nathom/filetype.nvim')
  use({ 'ibhagwan/fzf-lua', requires = 'kyazdani42/nvim-web-devicons' })

  -- Highlight
  use('EdenEast/nightfox.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('norcalli/nvim-colorizer.lua')
  use('nvim-treesitter/nvim-treesitter')

  -- UI Components
  use('akinsho/bufferline.nvim')
  use('kyazdani42/nvim-tree.lua')
  use('mbbill/undotree')

  -- Typing
  use('windwp/nvim-autopairs')
  use('machakann/vim-sandwich')

  -- Git
  use('tpope/vim-fugitive')
  use({ 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' })
  use('sindrets/diffview.nvim')

  -- Snipp Engine
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- -- CMP
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip')

  -- LSP
  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/nvim-lsp-ts-utils')
  use('jose-elias-alvarez/null-ls.nvim')
  use('b0o/schemastore.nvim')
  use('antoinemadec/FixCursorHold.nvim')
  use('nanotee/sqls.nvim')
end)
