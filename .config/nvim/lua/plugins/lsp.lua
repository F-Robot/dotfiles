local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local ts_utils = require('nvim-lsp-ts-utils')
local buf_map = require('utils/utils').buf_map
local cmp_capabilities = require('cmp_nvim_lsp')

local fn = vim.fn
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local sign_char = '•' -- U+2022 BULLET

local capabilities = cmp_capabilities.update_capabilities(
  lsp.protocol.make_client_capabilities()
)

local function handle_attach(client)
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
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end
local function handle_attach_with_formatting()
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

local function ts_utils_on_attach(client, bufnr)
  ts_utils.setup({
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,

    -- import all
    import_all_timeout = 5000, -- ms
    -- lower numbers = higher priority
    import_all_priorities = {
      same_file = 1, -- add to existing import statement
      local_files = 2, -- git files or files with relative path markers
      buffer_content = 3, -- loaded buffer content
      buffers = 4, -- loaded buffer names
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,
    -- if false will avoid organizing imports
    always_organize_imports = true,

    -- filter diagnostics
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},

    -- inlay hints
    auto_inlay_hints = true,
    inlay_hints_highlight = 'Comment',
    inlay_hints_priority = 200, -- priority of the hint extmarks
    inlay_hints_throttle = 150, -- throttle the inlay hint request
    inlay_hints_format = { -- format options for individual hint kind
      Type = {},
      Parameter = {},
      Enum = {},
      -- Example format customization for `Type` kind:
      -- Type = {
      --     highlight = "Comment",
      --     text = function(text)
      --         return "->" .. text:sub(2)
      --     end,
      -- },
    },

    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,
  })
  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)
  -- no default maps, so you may want to define some here
  local opts = { silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', ':TSLspOrganize<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':TSLspRenameFile<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':TSLspImportAll<CR>', opts)
  -- defaults maps
  handle_attach(client)
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
lspconfig.pylsp.setup({
  on_attach = handle_attach_with_formatting,
  capabilities = capabilities,
})
-- Bash language Server
lspconfig.bashls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
-- JS/TS language Server
lspconfig.tsserver.setup({
  init_options = ts_utils.init_options,
  on_attach = ts_utils_on_attach,
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
-- lspconfig.stylelint_lsp.setup({
--   settings = {
--     stylelintplus = {
--       -- see available options in stylelint-lsp documentation
--     },
--   },
-- })
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
-- Vuels language Server
lspconfig.vuels.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  init_options = {
    config = {
      vetur = {
        validation = {
          script = false,
          style = false,
          template = false,
        },
      },
    },
  },
})
-- Volar language Server
-- lspconfig.volar.setup({
--   on_attach = handle_attach,
--   capabilities = capabilities,
-- })
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
  extra_args = { '--config-path', vim.fn.expand('~/.config/stylua.toml') },
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
  on_attach = handle_attach_with_formatting,
  capabilities = capabilities,
  sources = sources,
})
