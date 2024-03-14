local getSymbol = function(name)
	if name == "error" then
		return "󰅙 "
	end
	if name == "warning" then
		return " "
	end
	if name == "hint" then
		return "󱐋 "
	end
	return "󰋼 "
end

local diagnostics_indicator = function(count, level, diagnostics_dict, context)
	local s = " "
	for e, n in pairs(diagnostics_dict) do
		s = s .. n .. getSymbol(e)
	end
	return s
end

require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		modified_icon = "🞄",
		diagnostics = "nvim_lsp",
		show_buffer_close_icons = false,
		diagnostics_indicator = diagnostics_indicator,
		offsets = {
			{
				filetype = "NvimTree",
				highlight = "Directory",
				text = "File Explorer",
			},
		},
	},
})

local keymap = vim.keymap

keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { silent = true })
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { silent = true })
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { silent = true })
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { silent = true })
keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { silent = true })
keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { silent = true })
keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { silent = true })
keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { silent = true })
keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { silent = true })
