require('nvim-treesitter').setup({
  indent = { enable = true },
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-P>',
      node_incremental = '<C-P>',
      node_decremental = '<bs>',
    },
  },
  textobjects = {
    swap = {
      enable = true,
      swap_next = { [']a'] = '@parameter.inner' },
      swap_previous = { ['[a'] = '@parameter.inner' },
    },
    move = {
      enable = true,
      goto_next_start = {
        [']f'] = '@function.outer',
        [']c'] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[c'] = '@class.outer',
      },
    },
  },
  ensure_installed = {
    'bash',
    'c',
    'diff',
    'html',
    'angular',
    'astro',
    'c_sharp',
    'css',
    'csv',
    'dockerfile',
    'git_config',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'go',
    'graphql',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'luadoc',
    'luap',
    'markdown',
    'markdown_inline',
    'php',
    'scss',
    'sql',
    'ssh_config',
    'svelte',
    'toml',
    'vue',
    'xml',
    'yaml',
    'python',
    'query',
    'regex',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'http',
  },
})
require('nvim-ts-autotag').setup({})
