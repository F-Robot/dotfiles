local map = require('utils/utils').map

-- Quiet
map('n', 'q', '<Cmd>bw!<CR>')
map('n', '<S-q>', '<Cmd>q!<CR>')

-- Disable Highligth
map('n', '<Leader>n', '<Cmd>nohlsearch<CR>', { silent = true })

-- Pane nagivation.
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

-- Go previous and next buffers in buffer list.
map('n', ']b', '<Cmd>bnext<CR>', { silent = true })
map('n', '[b', '<Cmd>bprevious<CR>', { silent = true })
-- map('n', '<leader>c', '<Cmd>bw!<CR>', { silent = true })

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
