local nightfox = require('nightfox')
local cmd = vim.cmd
-- nightfox.load 'duskfox'

nightfox.setup({
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = 'italic',
  },
})

cmd('colorscheme nightfox')
