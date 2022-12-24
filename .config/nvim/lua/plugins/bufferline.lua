local map = require("utils/utils").map

local diagnostics_indicator = function(count, level, diagnostics_dict, context)
	local s = " "
	for e, n in pairs(diagnostics_dict) do
		local sym = e == "error" and " " or (e == "warning" and " " or " ")
		s = s .. n .. sym
	end
	return s
end

require("bufferline").setup({
	options = {
		close_icon = "",
		modified_icon = "🞄",
		enforce_regular_tabs = true,
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
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

				if error ~= 0 then
					table.insert(result, { text = "  " .. error, fg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
				end
				return result
			end,
		},
	},
})

map("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
map("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
map("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
map("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
map("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true })
map("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true })
map("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true })
map("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true })
map("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true })
