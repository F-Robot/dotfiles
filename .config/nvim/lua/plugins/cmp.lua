local cmp = require("cmp")
local lspkind = require("lspkind")

local disable_in_comments = function()
	local context = require("cmp.config.context")
	if vim.api.nvim_get_mode().mode == "c" then
		return true
	else
		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	end
end

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local supertab = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif has_words_before() then
		cmp.complete()
	else
		fallback()
	end
end

local shift_supertab = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	else
		fallback()
	end
end

cmp.setup({
	enabled = disable_in_comments,
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[BUF ]",
				nvim_lsp = "[LSP ]",
				path = "[PATH ]",
				luasnip = "[SNIP ]",
				nvim_lsp_signature_help = "[SIGN ]",
			},
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(supertab, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(shift_supertab, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline({
		["<Tab>"] = cmp.mapping(supertab, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(shift_supertab, { "i", "s" }),
	}),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline({
		["<Tab>"] = cmp.mapping(supertab, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(shift_supertab, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
