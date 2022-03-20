local map = require('utils/utils').map

-- Command Mode Move
map('c', '<C-j>', '<Down>')
map('c', '<C-k>', '<Up>')
map('c', '<C-h>', '<Left>')
map('c', '<C-l>', '<Right>')

-- Substitute “pattern” on the current line.
map('c', ';s', 's//<Left>')

-- Substitute “pattern” in the current file.
map('c', ';g', '%s//<Left>')

-- Substitute “pattern” in the current file.
map('c', ';i', 'source ~/.config/nvim/init.lua<CR>')
