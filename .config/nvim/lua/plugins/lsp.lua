local lspconfig = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp')

local fn = vim.fn
local lsp = vim.lsp
local split = vim.split
local keymap = vim.keymap
local diagnostic = vim.diagnostic

local function setDiagnosticSymbol(name, icon)
  local hl = 'DiagnosticSign' .. name
  fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

setDiagnosticSymbol('Error', '󰅙')
setDiagnosticSymbol('Info', '󰋼')
setDiagnosticSymbol('Hint', '󱐋')
setDiagnosticSymbol('Warn', '')

diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

local capabilities =
  cmp_capabilities.default_capabilities(lsp.protocol.make_client_capabilities())

local function handle_attach(client)
  if client.server_capabilities.documentHighlightProvider then
    local document_highlight_group =
      api.nvim_create_augroup('DocumentHighlight', { clear = true })

    api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = document_highlight_group,
      buffer = 0,
      callback = function()
        lsp.buf.document_highlight()
      end,
    })

    api.nvim_create_autocmd('CursorMoved', {
      group = document_highlight_group,
      buffer = 0,
      callback = function()
        lsp.buf.clear_references()
      end,
    })
  end

  local map_opts = {
    buffer = true,
    silent = true,
  }

  local floating_windows_width = 80

  keymap.set('n', 'gd', function()
    lsp.buf.definition()
  end, map_opts)

  keymap.set('n', 'gD', function()
    lsp.buf.declaration()
  end, map_opts)

  keymap.set('n', 'gt', function()
    lsp.buf.type_definition()
  end, map_opts)

  keymap.set('n', 'gr', function()
    lsp.buf.references()
  end, map_opts)

  keymap.set('n', 'gi', function()
    lsp.buf.implementation()
  end, map_opts)

  keymap.set('n', 'ge', function()
    lsp.buf.rename()
  end, map_opts)

  keymap.set('n', 'K', function()
    lsp.buf.hover()
  end, map_opts)

  keymap.set('n', 'ga', function()
    lsp.buf.code_action()
  end, map_opts)

  keymap.set('n', 'gf', function()
    vim.lsp.buf.format({
      filter = function(server)
        return server.name ~= 'tsserver'
      end,
    })
  end, map_opts)

  keymap.set('i', '<C-k>', function()
    lsp.buf.signature_help()
  end, map_opts)

  keymap.set('n', 'J', function()
    diagnostic.open_float(0, {
      source = 'always',
      scope = 'line',
      header = false,
      width = floating_windows_width,
    })
  end, map_opts)

  keymap.set('n', '[g', function()
    diagnostic.goto_prev({
      float = {
        source = 'always',
        width = floating_windows_width,
      },
    })
  end, map_opts)

  keymap.set('n', ']g', function()
    diagnostic.goto_next({
      float = {
        source = 'always',
        width = floating_windows_width,
      },
    })
  end, map_opts)
end

local function handle_attach_ts(client)
  if client.server_capabilities.documentHighlightProvider then
    local document_highlight_group =
      api.nvim_create_augroup('DocumentHighlight', { clear = true })

    api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = document_highlight_group,
      buffer = 0,
      callback = function()
        lsp.buf.document_highlight()
      end,
    })

    api.nvim_create_autocmd('CursorMoved', {
      group = document_highlight_group,
      buffer = 0,
      callback = function()
        lsp.buf.clear_references()
      end,
    })
  end

  local map_opts = {
    buffer = true,
    silent = true,
  }

  local floating_windows_width = 80

  keymap.set('n', 'gd', function()
    lsp.buf.definition()
  end, map_opts)

  keymap.set('n', 'gD', function()
    lsp.buf.declaration()
  end, map_opts)

  keymap.set('n', 'gt', function()
    lsp.buf.type_definition()
  end, map_opts)

  keymap.set('n', 'gr', function()
    lsp.buf.references()
  end, map_opts)

  keymap.set('n', 'gi', function()
    lsp.buf.implementation()
  end, map_opts)

  keymap.set('n', 'ge', function()
    lsp.buf.rename()
  end, map_opts)

  keymap.set('n', 'K', function()
    lsp.buf.hover()
  end, map_opts)

  keymap.set('n', 'ga', function()
    lsp.buf.code_action()
  end, map_opts)

  keymap.set('n', 'gf', function()
    vim.lsp.buf.format({
      filter = function(server)
        return server.name ~= 'tsserver'
      end,
    })
  end, map_opts)

  keymap.set('i', '<C-k>', function()
    lsp.buf.signature_help()
  end, map_opts)

  keymap.set('n', 'J', function()
    diagnostic.open_float(0, {
      source = 'always',
      scope = 'line',
      header = false,
      width = floating_windows_width,
    })
  end, map_opts)

  keymap.set('n', '[g', function()
    diagnostic.goto_prev({
      float = {
        source = 'always',
        width = floating_windows_width,
      },
    })
  end, map_opts)

  keymap.set('n', ']g', function()
    diagnostic.goto_next({
      float = {
        source = 'always',
        width = floating_windows_width,
      },
    })
  end, map_opts)

  local ts_utils = require('nvim-lsp-ts-utils')

  ts_utils.setup({
    filter_out_diagnostics_by_code = { 80001 },
  })

  ts_utils.setup_client(client)
end

lspconfig.tsserver.setup({
  init_options = require('nvim-lsp-ts-utils').init_options,
  on_attach = handle_attach_ts,
  capabilities = capabilities,
})
lspconfig.volar.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
})
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
        typeCheckingMode = 'strict',
        useLibraryCodeForTypes = true,
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
lspconfig.marksman.setup({
  capabilities = capabilities,
  on_attach = handle_attach,
})
lspconfig.bashls.setup({
  capabilities = capabilities,
  on_attach = handle_attach,
})
-- lspconfig.tailwindcss.setup({
--   capabilities = capabilities,
--   on_attach = handle_attach,
-- })
lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = handle_attach,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})
lspconfig.lua_ls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

local null_ls = require('null-ls')

null_ls.setup({
  on_attach = handle_attach,
  capabilities = capabilities,
  diagnostics_format = '#{m} [#{c}]',
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,

    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.cfn_lint,
    null_ls.builtins.diagnostics.luacheck.with({
      extra_args = { '--globals', 'vim' },
    }),

    -- null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.code_actions.gitsigns,
    require('typescript.extensions.null-ls.code-actions'),
  },
})
