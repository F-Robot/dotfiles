local api = vim.api
local map = vim.keymap.set

require('luasnip').setup({
  history = true,
  updateevents = 'TextChanged',
})

require('luasnip.loaders.from_vscode').lazy_load()

api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    if
      require('luasnip').session.current_nodes[api.nvim_get_current_buf()]
      and not require('luasnip').session.jump_active
    then
      require('luasnip').unlink_current()
    end
  end,
})

map('i', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map('i', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
map('s', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
map('s', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
