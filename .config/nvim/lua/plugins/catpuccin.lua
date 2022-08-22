local g = vim.g

vim.g.catppuccin_flavour = 'macchiato' -- latte, frappe, macchiato, mocha

require('catppuccin').setup({
  transparent_background = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath('cache') .. '/catppuccin',
  },
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = { 'italic' },
    keywords = { 'italic' },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
})

vim.cmd([[colorscheme catppuccin]])
