require("nvim-tree").setup({
	disable_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = true,
	view = {
		width = 10,
		adaptive_size = true,
		hide_root_folder = true,
		signcolumn = "no",
	},
	renderer = {
		icons = {
			webdev_colors = true,
			show = {
				git = false,
			},
		},
		symlink_destination = false,
	},
	git = {
		enable = false,
		ignore = false,
		show_on_dirs = false,
	},
})

local keymap = vim.keymap

-- Toggle
keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")
