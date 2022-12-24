return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- -- Colorschemes and Highlights
	use("folke/tokyonight.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- -- Filesystem
	use("ibhagwan/fzf-lua")
	use("kyazdani42/nvim-web-devicons")

	-- -- Git
	use("tpope/vim-fugitive")
	use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" })

	-- -- Typing
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("kylechui/nvim-surround")
	use("norcalli/nvim-colorizer.lua")

	-- -- UI
	use("mbbill/undotree")
	use("nvim-tree/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- -- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use({ "hrsh7th/cmp-nvim-lsp", requires = "onsails/lspkind-nvim" })

	-- -- Snippets
	use("L3MON4D3/LuaSnip")
	use("b0o/schemastore.nvim")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- -- LSP
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	-- use('jose-elias-alvarez/nvim-lsp-ts-utils')
end)
