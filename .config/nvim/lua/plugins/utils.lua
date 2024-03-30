local cmp = require('cmp')
local luasnip = require('luasnip')

local disable_in_comments = function()
  local context = require('cmp.config.context')
  if vim.api.nvim_get_mode().mode == 'c' then
    return true
  else
    return not context.in_treesitter_capture('comment')
      and not context.in_syntax_group('Comment')
  end
end

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
      == nil
end

local tab_function = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local tab_shift_function = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

local expand_function = function(args)
  require('luasnip').lsp_expand(args.body)
end

return {
  tab_function = tab_function,
  expand_function = expand_function,
  tab_shift_function = tab_shift_function,
  disable_in_comments = disable_in_comments,
}
