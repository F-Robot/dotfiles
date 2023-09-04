require('catppuccin').setup({
  flavour = 'mocha',
  transparent_background = true,
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    keywords = { 'italic' },
  },
  integrations = {
    nvimtree = true,
    gitsigns = true,
    cmp = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
  },
})

vim.cmd.colorscheme('catppuccin')
