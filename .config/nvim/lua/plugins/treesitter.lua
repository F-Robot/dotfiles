require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {
      'help',
      'man',
      'text',
    },
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    'lua',
    'vim',
    'vue',
    'css',
    'html',
    'json',
    'bash',
    'python',
    'tsx',
    'javascript',
    'typescript',
  },
})
