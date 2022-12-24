require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>sw", gs.preview_hunk)
		map("n", "<leader>su", gs.undo_stage_hunk)
		map({ "n", "v" }, "<leader>ss", ":Gitsigns stage_hunk<CR>")
		map({ "n", "v" }, "<leader>sr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>sS", gs.stage_buffer)
		map("n", "<leader>sR", gs.reset_buffer)
	end,
})
