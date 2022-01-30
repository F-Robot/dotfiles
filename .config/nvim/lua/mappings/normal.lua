local map = require('utils/utils').map

-- Quiet
map('n', 'q', '<Cmd>q<CR>')

-- Disable Highligth
map('n', '<Leader>n', '<Cmd>nohlsearch<CR>', { silent = true })

-- Source current file
map('n', '<C-s>', '<Cmd>source /home/ricardo/.config/nvim/init.lua<CR>')

-- Always search with 'very magic' mode.
map('n', '/', '/\\v')
map('n', '?', '?\\v')

-- Pane nagivation.
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<S-H>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- Resize current window sizes.
map('n', '=', '2<C-w>+')
map('n', '_', '2<C-w>-')
map('n', '+', '2<C-w>>')
map('n', '-', '2<C-w><')

-- Go previous and next buffers in buffer list.
map('n', '<C-p>', '<Cmd>bprevious<CR>', { silent = true })
map('n', '<C-n>', '<Cmd>bnext<CR>', { silent = true })
map('n', '<Leader>c', '<Cmd>bd!<CR>', { silent = true })

-- Add [count] blank lines above or below the cursor.
map(
  'n',
  '[<Space>',
  "<Cmd>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<CR>",
  { silent = true }
)
map(
  'n',
  ']<Space>',
  "<Cmd>put =repeat(nr2char(10), v:count1) <Bar> '[-1<CR>",
  { silent = true }
)

-- Comment and uncomment operator.
map('n', 'gc', '<Cmd>set operatorfunc=mappings#operator#comment#<CR>g@', {
  silent = true,
})
