require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"lua",
		"vue",
		"css",
		"html",
		"json",
		"bash",
		"python",
		"javascript",
		"typescript",
	},
})
