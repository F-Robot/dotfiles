require('luasnip').setup({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
})

require('luasnip.loaders.from_vscode').lazy_load()

local api = vim.api

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

local keymap = vim.keymap

keymap.set('i', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
keymap.set('i', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
keymap.set('s', '<C-k>', '<Cmd>lua require"luasnip".jump(-1)<CR>', { noremap = false })
keymap.set('s', '<C-j>', '<Cmd>lua require"luasnip".jump(1)<CR>', { noremap = false })
