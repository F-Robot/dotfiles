require("fzf-lua").setup({
	winopts = {
		preview = {
			vertical = "down:45%",
			horizontal = "right:60%",
			layout = "horizontal",
			scrollbar = false,
		},
	},
})

-- FZF Mapping
local map = require("utils/utils").map
local grep_command = "<Cmd>lua require'fzf-lua'.grep_project({ fzf_cli_args = '--nth 2..' })<CR>"

map("n", "<Leader>ff", "<Cmd>FzfLua files<CR>", { silent = true })
map("n", "<Leader>fg", grep_command, { silent = true })
map("n", "<Leader>fs", "<Cmd>FzfLua git_status<CR>", { silent = true })
map("n", "<Leader>fc", "<Cmd>FzfLua git_commits<CR>", { silent = true })
