local cmp = require('cmp')
local lspkind = require('lspkind')
local utils = require('plugins.utils')

cmp.setup({
  enabled = utils.disable_in_comments,
  snippet = {
    expand = utils.expand_function,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
      show_labelDetails = true,
      menu = {
        buffer = '[BUF  ]',
        path = '[PATH  ]',
        calc = '[CALC 󰃬]',
        nvim_lsp = '[LSP  ]',
        nvim_lua = '[LUA  ]',
        luasnip = '[SNIP  ]',
        nvim_lsp_signature_help = '[SIGN 󰆧 ]',
      },
    }),
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(utils.tab_function, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(utils.tab_shift_function, { 'i', 's' }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
