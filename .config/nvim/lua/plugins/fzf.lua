require("fzf-lua").setup({
	winopts = {
		preview = {
			default = "bat_native",
			vertical = "down:40%",
			horizontal = "right:60%",
			layout = "horizontal",
			scrollbar = false,
		},
	},
	files = {
		git_icons = false,
	},
})

local keymap = vim.keymap

keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { silent = true })
keymap.set("n", "<leader>fs", "<cmd>FzfLua git_status<cr>", { silent = true })
keymap.set("n", "<leader>fc", "<cmd>FzfLua git_commits<cr>", { silent = true })
keymap.set(
	"n",
	"<leader>fg",
	"<Cmd>lua require'fzf-lua'.grep_project({ fzf_cli_args = '--nth 2..' })<CR>",
	{ silent = true }
)
