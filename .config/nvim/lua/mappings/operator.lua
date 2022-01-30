local map = require('utils/utils').map

-- Comment and uncomment operator.
map('x', 'gc', ':<C-u>call mappings#operator#comment#(visualmode())<CR>', {
  silent = true,
})

-- Always search with 'very magic' mode.
map('x', '/', '/\\v')
map('x', '?', '?\\v')

-- Normal Mode
map('x', 'q', '<Esc>')
