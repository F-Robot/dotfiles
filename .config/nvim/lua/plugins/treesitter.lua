require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
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
require('nvim-treesitter.configs').setup({
  pairs = {
    enable = true,
    highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
    goto_right_end = false, -- whether to go to the end of the right partner or the beginning
    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
    keymaps = {
      goto_partner = '%',
    },
  },
})
