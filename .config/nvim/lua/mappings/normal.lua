local map = require('utils/utils').map

-- Quiet
map('n', '<leader>q', '<Cmd>q<CR>')

-- Add html filetype
map('n', '<leader>h', '<Cmd>set filetype+=.html<CR>')

-- Disable Highligth
map('n', '<Leader>n', '<Cmd>nohlsearch<CR>', { silent = true })

-- Go previous and next buffers in buffer list.
map('n', ']b', '<Cmd>bnext<CR>', { silent = true })
map('n', '[b', '<Cmd>bprevious<CR>', { silent = true })

-- Close buffer
map('n', '<leader>c', '<Cmd>bd!<CR>', { silent = true })

-- Copy and Paste from + register
map('v', '<c-c>', '"+y')
map('n', '<c-v>', '"+p')

-- Search under cursor word
map('n', '<leader>u', 'yiw/<C-R>"<CR>')

-- Search yanked text
map('n', '<leader>y', '/<C-R>"<CR>')

-- Search and replace under cursor word
map('n', '<leader>su', 'yiw:%s/<C-R>"/<C-R>"/<left>')

-- Search and replace yanked text
map('n', '<leader>sy', ':%s/<C-R>"/<C-R>"/<left>')

-- Comment and uncomment operator.
map('n', 'gc', '<Cmd>set operatorfunc=mappings#operator#comment#<CR>g@', {
  silent = true,
})

-- Pane nagivation.
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

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
