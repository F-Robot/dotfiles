local null_ls = require('null-ls')
local lspconfig = require('lspconfig')
local ts_utils = require('nvim-lsp-ts-utils')
local buf_map = require('utils/utils').buf_map
local cmp_capabilities = require('cmp_nvim_lsp')

local fn = vim.fn
local lsp = vim.lsp
local split = vim.split
local diagnostic = vim.diagnostic

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

local function handle_on_attach(client)
  handle_attach()
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local function sql_handle_on_attach(client, bufnr)
  require('sqls').on_attach(client, bufnr)
  handle_attach()
end

local function ts_handle_on_attach(client)
  local ts_utils_config = { filter_out_diagnostics_by_code = { 80001 } }
  ts_utils.setup(ts_utils_config)
  ts_utils.setup_client(client)
  handle_attach()
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local capabilities = cmp_capabilities.update_capabilities(
  lsp.protocol.make_client_capabilities()
)

diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

local sign_char = '•' -- U+2022 BULLET

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

-- Python language Server
lspconfig.pyright.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})

-- HTML language Server
lspconfig.html.setup({
  on_attach = handle_on_attach,
  capabilities = capabilities,
  cmd = { 'html-languageserver', '--stdio' },
})

-- HTML language Server
lspconfig.bashls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})

-- CSS Language Server
lspconfig.cssls.setup({
  on_attach = handle_on_attach,
  capabilities = capabilities,
  cmd = { 'css-languageserver', '--stdio' },
})

-- JS/TS language Server
lspconfig.tsserver.setup({
  on_attach = ts_handle_on_attach,
  capabilities = capabilities,
})

-- SQL language server
lspconfig.sqls.setup({
  on_attach = sql_handle_on_attach,
  capabilities = capabilities,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=localhost port=5432 user=postgres password=6413 dbname=test',
        },
      },
    },
  },
})

-- Vue language Server
lspconfig.vuels.setup({
  on_attach = handle_on_attach,
  capabilities = capabilities,
})

-- JSON language Server
lspconfig.jsonls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  cmd = { 'json-languageserver', '--stdio' },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- Lua language Server
local lua_bin = '/home/ricardo/.local/lib/lua-language-server/bin/lua-language-server'
local lua_params = '/home/ricardo/.local/lib/lua-language-server/main.lua'
local lua_args = '-E'

lspconfig.sumneko_lua.setup({
  on_attach = handle_on_attach,
  capabilities = capabilities,
  cmd = { lua_bin, lua_args, lua_params },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [fn.expand('$VIMRUNTIME/lua')] = true,
          [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = { enable = false },
    },
  },
})

-- Null-Ls setup
local lua_config_path = { '--config-path', vim.fn.expand('~/.config/stylua.toml') }
local formatting_stylua = { extra_args = lua_config_path }
local formatting_prettierd = {
  filetypes = {
    'javascriptreact',
    'typescriptreact',
    'javascript',
    'typescript',
    'vue',
    'json',
    'html',
    'scss',
  },
}
local djhtml_args = {
  extra_args = function(params)
    return {
      '--tabwidth',
      vim.api.nvim_buf_get_option(params.bufnr, 'shiftwidth'),
    }
  end,
}
local sources = {
  -- Diagnostic
  null_ls.builtins.diagnostics.eslint_d,
  null_ls.builtins.diagnostics.stylelint,
  -- Formatting
  null_ls.builtins.formatting.prettierd.with(formatting_prettierd),
  null_ls.builtins.formatting.stylua.with(formatting_stylua),
  null_ls.builtins.formatting.djhtml.with(djhtml_args),
  null_ls.builtins.formatting.stylelint,
  null_ls.builtins.formatting.black,
}

null_ls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  sources = sources,
})
