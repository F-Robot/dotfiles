require('mini.jump').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.bufremove').setup()
require('mini.ai').setup({
  n_lines = 500,
})

local map = vim.keymap.set

map('n', '<leader>c', function()
  require('mini.bufremove').delete()
end)
