local cmp = require('cmp')
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
      == nil
end

local disable_in_comments = function()
  local context = require('cmp.config.context')
  if vim.api.nvim_get_mode().mode == 'c' then
    return true
  else
    return not context.in_treesitter_capture('comment')
      and not context.in_syntax_group('Comment')
  end
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
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-c>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(supertab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_supertab, { 'i', 's' }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = '[BUF ]',
        nvim_lsp = '[LSP ]',
        path = '[PATH ]',
        luasnip = '[SNIP ]',
        nvim_lsp_signature_help = '[SIGN ]',
      },
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),
})
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.cmdline({
    ['<Tab>'] = cmp.mapping(supertab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_supertab, { 'i', 's' }),
  }),
})
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
  mapping = cmp.mapping.preset.cmdline({
    ['<Tab>'] = cmp.mapping(supertab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_supertab, { 'i', 's' }),
  }),
})
