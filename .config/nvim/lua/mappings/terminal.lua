local map = require('utils/utils').map

-- Normal Mode
map('t', '<C-n>', '<C-\\><C-n>', { silent = true })

-- Toggle floating terminal or create new one if there is none.
map(
  't',
  '<M-z>',
  "<Cmd>lua require('utils/mappings/normal/terminal').toggle()<CR>",
  { silent = true }
)
map(
  'n',
  '<M-z>',
  "<Cmd>lua require('utils/mappings/normal/terminal').toggle()<CR>",
  { silent = true }
)
map(
  'i',
  '<M-z>',
  "<Esc><Cmd>lua require('utils/mappings/normal/terminal').toggle()<CR>",
  { silent = true }
)
