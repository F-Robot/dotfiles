local keymap = vim.keymap

-- Disable Highligth
keymap.set('n', '<leader>n', '<cmd>nohlsearch<cr>', { silent = true })

-- close buffer
keymap.set('n', '<leader>c', '<cmd>bd!<cr>', { silent = true })

-- Write buffer
keymap.set('n', '<leader>w', '<cmd>w<cr>', { silent = true })

-- search under cursor word
keymap.set('n', '<leader>u', 'yiw/\\<<c-R>"\\><cr>')

-- search and replace under cursor word
keymap.set('n', '<leader>su', 'yiw:%s/<c-R>"/<C-R>"/<left>')

-- close window.
keymap.set('n', '<space>q', '<cmd>quit<cr>', { silent = true })

-- Window nagivation.
keymap.set('n', '<c-j>', '<C-w>j')
keymap.set('n', '<c-k>', '<C-w>k')
keymap.set('n', '<c-h>', '<C-w>h')
keymap.set('n', '<c-l>', '<C-w>l')

-- Resize current window sizes.
keymap.set('n', '<s-Up>', '2<c-w>+')
keymap.set('n', '<s-Down>', '2<c-w>-')
keymap.set('n', '<s-Right>', '2<c-w>>')
keymap.set('n', '<s-Left>', '2<c-w><')

-- Add [count] blank lines above or below the cursor.
keymap.set(
  'n',
  '[<space>',
  "<cmd>put! =repeat(nr2char(10), v:count1) <Bar> ']+1<cr>",
  { silent = true }
)
keymap.set(
  'n',
  ']<space>',
  "<cmd>put =repeat(nr2char(10), v:count1) <Bar> '[-1<cr>",
  { silent = true }
)
