local cmp = require('cmp')
local luasnip = require('luasnip')
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
  elseif luasnip.expand_or_locally_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local shift_supertab = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
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
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(supertab, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(shift_supertab, { 'i', 's' }),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }),
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = '[BUF]',
        nvim_lsp = '[LSP]',
        path = '[PATH]',
        luasnip = '[SNIP]',
      },
    }),
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
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
