local autopairs = require('nvim-autopairs')
autopairs.setup({
  ignored_next_char = string.gsub([[ [%w%%%%[%.] ]], '%s+', ''),
})
