require('mason').setup()
require('mason-lspconfig').setup()
require('mason-null-ls').setup({ handlers = {} })
require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({})
  end,
  ['lua_ls'] = function()
    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })
  end,
})
