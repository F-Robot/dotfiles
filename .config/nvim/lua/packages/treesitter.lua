require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'html',
    'css',
    'scss',
    'json',
    'javascript',
    'typescript',
    'tsx',
    'vue',
    'lua',
    'python',
    'bash',
  },
})
