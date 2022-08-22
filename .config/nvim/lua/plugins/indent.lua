local indent_blankline = require('indent_blankline')
local cmd = vim.cmd

cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])

indent_blankline.setup({
  buftype_exclude = { 'terminal', 'nofile' },
  filetype_exclude = { 'help', 'man' },
  char_highlight_list = {
    'IndentBlanklineIndent6',
    'IndentBlanklineIndent5',
    'IndentBlanklineIndent4',
    'IndentBlanklineIndent3',
    'IndentBlanklineIndent2',
    'IndentBlanklineIndent1',
  },
})
