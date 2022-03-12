local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local buf_map = require('utils/utils').buf_map
local cmp_capabilities = require('cmp_nvim_lsp')

local fn = vim.fn
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local sign_char = '•' -- U+2022 BULLET

local capabilities = cmp_capabilities.update_capabilities(
  lsp.protocol.make_client_capabilities()
)

local function handle_attach()
  local opts = { silent = true }
  buf_map('n', 'K', '<Cmd>LspHover<CR>', opts)
  buf_map('n', 'J', '<Cmd>LspDiagLine<CR>', opts)
  buf_map('n', 'gd', '<Cmd>LspDef<CR>', opts)
  buf_map('n', 'gr', '<Cmd>LspRefs<CR>', opts)
  buf_map('n', 'gn', '<Cmd>LspRename<CR>', opts)
  buf_map('n', 'ga', '<Cmd>LspCodeAction<CR>', opts)
  buf_map('n', 'gf', '<Cmd>LspFormatting<CR>', opts)
  buf_map('n', 'gi', '<Cmd>LspImplementation<CR>', opts)
  buf_map('n', '[g', '<Cmd>LspDiagPrev<CR>', opts)
  buf_map('n', ']g', '<Cmd>LspDiagNext<CR>', opts)
  buf_map('i', '<C-k>', '<Cmd>LspSignatureHelp<CR>', opts)
end

diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

fn.sign_define('DiagnosticSignError', {
  text = sign_char,
  texthl = 'DiagnosticSignError',
})
fn.sign_define('DiagnosticSignWarn', {
  text = sign_char,
  texthl = 'DiagnosticSignWarn',
})
fn.sign_define('DiagnosticSignInfo', {
  text = sign_char,
  texthl = 'DiagnosticSignInfo',
})
fn.sign_define('DiagnosticSignHint', {
  text = sign_char,
  texthl = 'DiagnosticSignHint',
})

-- Bash language Server
lspconfig.bashls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})

-- Html language Server
lspconfig.html.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
-- CSS language Server
lspconfig.cssls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
-- Json language Server
lspconfig.jsonls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})
-- Vue language Server
lspconfig.vuels.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = 'kebab',
          useScaffoldSnippets = false,
        },
        validation = {
          script = false,
          style = false,
          template = false,
        },
      },
    },
  },
})

-- Lua Language Server
lspconfig.sumneko_lua.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
-- Null Language Server
local formatting_stylua = {
  extra_args = { '--config-path', vim.fn.expand('~/.dotfiles/stylua.toml') },
}
local sources = {
  -- Diagnostic
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.shellcheck,
  -- Formatting
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.stylua.with(formatting_stylua),
}
null_ls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  sources = sources,
})
