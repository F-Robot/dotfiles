require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true
  },
  ensure_installed = {
    'html',
    'css',
    'scss',
    'json',
    'javascript',
    'typescript',
    'vue',
    'lua',
    'python',
    'bash',
  },
})
