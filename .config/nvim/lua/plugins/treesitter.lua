require('nvim-treesitter.configs').setup({
  auto_install = true,
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  ensure_installed = {
    'bash',
    'c',
    'diff',
    'html',
    'css',
    'csv',
    'dockerfile',
    'go',
    'javascript',
    'json',
    'lua',
    'php',
    'sql',
    'toml',
    'xml',
    'yaml',
    'python',
    'tsx',
    'typescript',
    'vim',
    'http',
  },
})
