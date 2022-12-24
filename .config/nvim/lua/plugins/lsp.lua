local lspconfig = require("lspconfig")
local cmp_capabilities = require("cmp_nvim_lsp")

local fn = vim.fn
local env = vim.env
local split = vim.split
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local keymap = vim.keymap

diagnostic.config({
	virtual_text = false,
	severity_sort = true,
})

local sign_char = "•"

fn.sign_define("DiagnosticSignError", {
	text = sign_char,
	texthl = "DiagnosticSignError",
})
fn.sign_define("DiagnosticSignWarn", {
	text = sign_char,
	texthl = "DiagnosticSignWarn",
})
fn.sign_define("DiagnosticSignInfo", {
	text = sign_char,
	texthl = "DiagnosticSignInfo",
})
fn.sign_define("DiagnosticSignHint", {
	text = sign_char,
	texthl = "DiagnosticSignHint",
})

local capabilities = cmp_capabilities.default_capabilities(lsp.protocol.make_client_capabilities())

local function handle_attach()
	local map_opts = {
		buffer = true,
		silent = true,
	}

	local floating_windows_width = 55

	keymap.set("n", "gd", function()
		lsp.buf.definition()
	end, map_opts)

	keymap.set("n", "gD", function()
		lsp.buf.declaration()
	end, map_opts)

	keymap.set("n", "gt", function()
		lsp.buf.type_definition()
	end, map_opts)

	keymap.set("n", "gr", function()
		lsp.buf.references()
	end, map_opts)

	keymap.set("n", "gi", function()
		lsp.buf.implementation()
	end, map_opts)

	keymap.set("n", "ge", function()
		lsp.buf.rename()
	end, map_opts)

	keymap.set("n", "K", function()
		lsp.buf.hover()
	end, map_opts)

	keymap.set("n", "ga", function()
		lsp.buf.code_action()
	end, map_opts)

	keymap.set("n", "gf", function()
		vim.lsp.buf.format({
			filter = function(server)
				return server.name ~= "tsserver"
			end,
		})
	end, map_opts)

	keymap.set("i", "<C-k>", function()
		lsp.buf.signature_help()
	end, map_opts)

	keymap.set("n", "J", function()
		diagnostic.open_float(0, {
			source = "always",
			scope = "line",
			header = false,
			width = floating_windows_width,
		})
	end, map_opts)

	keymap.set("n", "[g", function()
		diagnostic.goto_prev({
			float = {
				source = "always",
				width = floating_windows_width,
			},
		})
	end, map_opts)

	keymap.set("n", "]g", function()
		diagnostic.goto_next({
			float = {
				source = "always",
				width = floating_windows_width,
			},
		})
	end, map_opts)
end

lspconfig.tsserver.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
})
lspconfig.volar.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
})
-- lspconfig.vuels.setup({
-- 	on_attach = handle_attach,
-- 	capabilities = capabilities,
-- })
lspconfig.dockerls.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
})
lspconfig.pyright.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
	settings = {
		{
			python = {
				typeCheckingMode = "strict",
				useLibraryCodeForTypes = true,
				pythonPlatform = "Linux",
			},
		},
	},
})
lspconfig.cssls.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
})
lspconfig.html.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
})
lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = handle_attach,
})
lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_attach = handle_attach,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
})
lspconfig.sumneko_lua.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
	cmd = {
		string.format("%s/.local/lib/lua-language-server/bin/lua-language-server", env.HOME),
		"-E",
		string.format("%s/.local/lib/lua-language-server/main.lua", env.HOME),
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[fn.expand("$VIMRUNTIME/lua")] = true,
					[fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			telemetry = { enable = false },
		},
	},
})

local null_ls = require("null-ls")
local command_resolver = require("null-ls.helpers.command_resolver")

null_ls.setup({
	on_attach = handle_attach,
	capabilities = capabilities,
	diagnostics_format = "#{m} [#{c}]",
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.stylelint.with({
			dynamic_command = command_resolver.from_node_modules(),
		}),

		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.luacheck,
		null_ls.builtins.diagnostics.stylelint.with({
			dynamic_command = command_resolver.from_node_modules(),
		}),
	},
})
