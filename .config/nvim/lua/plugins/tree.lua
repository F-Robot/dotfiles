require("nvim-tree").setup({
	disable_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
	view = {
		width = 10,
		adaptive_size = true,
		signcolumn = "no",
	},
	renderer = {
		root_folder_label = false,
		icons = {
			webdev_colors = true,
			show = {
				git = false,
			},
		},
		symlink_destination = false,
	},
})

local keymap = vim.keymap

-- Toggle
keymap.set("n", "<space>t", "<cmd>NvimTreeToggle<cr>")
