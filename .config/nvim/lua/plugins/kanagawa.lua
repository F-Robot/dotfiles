local kanagawa = require('kanagawa')
local cmd = vim.cmd

kanagawa.setup({
  transparent = true, -- do not set background color
})

cmd([[colorscheme kanagawa]]) -- Colorscheme TokyoNight
