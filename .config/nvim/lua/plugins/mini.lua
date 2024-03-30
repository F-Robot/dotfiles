require('mini.jump').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.bufremove').setup()

local ai = require('mini.ai')

require('mini.ai').setup({
  n_lines = 500,
  custom_textobjects = {
    o = ai.gen_spec.treesitter({
      a = { '@block.outer', '@conditional.outer', '@loop.outer' },
      i = { '@block.inner', '@conditional.inner', '@loop.inner' },
    }, {}),
    f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
    c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
    t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },
    d = { '%f[%d]%d+' },
    e = {
      {
        '%u[%l%d]+%f[^%l%d]',
        '%f[%S][%l%d]+%f[^%l%d]',
        '%f[%P][%l%d]+%f[^%l%d]',
        '^[%l%d]+%f[^%l%d]',
      },
      '^().*()$',
    },
    g = function()
      local from = { line = 1, col = 1 }
      local to = {
        line = vim.fn.line('$'),
        col = math.max(vim.fn.getline('$'):len(), 1),
      }
      return { from = from, to = to }
    end,
    u = ai.gen_spec.function_call(),
    U = ai.gen_spec.function_call({ name_pattern = '[%w_]' }),
  },
})
require('mini.comment').setup({
  options = {
    custom_commentstring = function()
      return require('ts_context_commentstring.internal').calculate_commentstring()
        or vim.bo.commentstring
    end,
  },
})

local map = vim.keymap.set

map('n', '<leader>c', function()
  require('mini.bufremove').delete()
end)
