local fn = vim.fn
local api = vim.api
local lsp = vim.lsp.buf
local map = vim.keymap.set
local diagnostic = vim.diagnostic
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function setDiagnosticSymbol(name, icon)
  local hl = 'DiagnosticSign' .. name
  fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●',
    source = 'if_many',
  },
  severity_sort = true,
})

setDiagnosticSymbol('Error', ' ')
setDiagnosticSymbol('Info', ' ')
setDiagnosticSymbol('Hint', ' ')
setDiagnosticSymbol('Warn', ' ')

map('n', '[d', diagnostic.goto_prev)
map('n', ']d', diagnostic.goto_next)
map('n', 'J', function()
  diagnostic.open_float({
    source = 'always',
  })
end)
map('n', 'gq', diagnostic.setloclist)

api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }

    map('n', 'gd', lsp.definition, opts)
    map('n', 'gr', lsp.rename, opts)
    map('n', 'K', lsp.hover, opts)
    map('n', 'ge', lsp.references, opts)
    map('n', 'gt', lsp.type_definition, opts)
    map('n', 'gf', function()
      lsp.format({ async = true })
    end, opts)
    map({ 'n', 'v' }, 'ga', lsp.code_action, opts)

    map('n', 'gc', lsp.declaration, opts)
    map('n', 'gi', lsp.implementation, opts)
    map('n', 'gs', lsp.signature_help, opts)

    map('n', 'gwa', lsp.add_workspace_folder, opts)
    map('n', 'gwr', lsp.remove_workspace_folder, opts)
    map('n', 'gwl', function()
      print(vim.inspect(lsp.list_workspace_folders()))
    end, opts)
  end,
})

require('mason').setup()
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,
    ['yamlls'] = function()
      require('lspconfig').yamlls.setup({
        capabilities = capabilities,
        yaml = {
          schemaStore = {
            enable = false,
            url = '',
          },
          schemas = require('schemastore').yaml.schemas(),
        },
      })
    end,
    ['jsonls'] = function()
      require('lspconfig').jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = false },
          },
        },
      })
    end,
    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'jit', 'vim', 'nvim_bufferline' },
            },
          },
        },
      })
    end,
  },
})
require('mason-null-ls').setup({ handlers = {} })
require('null-ls').setup({})
