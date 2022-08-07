local g = vim.g

g.moonlight_italic_comments = true
g.moonlight_italic_keywords = true
g.moonlight_italic_functions = true
g.moonlight_italic_variables = false
g.moonlight_contrast = true
g.moonlight_borders = false
g.moonlight_disable_background = true

-- Load the colorscheme
require('moonlight').set()

