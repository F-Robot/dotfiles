local fzf_lua = require('fzf-lua')
local map = require('utils/utils').map

fzf_lua.setup({
  winopts = {
    preview = {
      default = 'bat_native',
      scrollbar = 'float',
      delay = 0,
    },
  },
  keymap = {
    builtin = {
      ['<S-down>'] = 'preview-page-down',
      ['<S-up>'] = 'preview-page-up',
    },
    fzf = {
      ['ctrl-f'] = 'half-page-down',
      ['ctrl-b'] = 'half-page-up',
    },
  },
})
-- FZF Mapping
map('n', '<Leader>F', '<Cmd>FzfLua<CR>', { silent = true })
map('n', '<Leader>ff', '<Cmd>FzfLua files<CR>', { silent = true })
map('n', '<Leader>fb', '<Cmd>FzfLua buffers<CR>', { silent = true })
map('n', '<Leader>fgs', '<Cmd>FzfLua git_status<CR>', { silent = true })
map('n', '<Leader>fgc', '<Cmd>FzfLua git_commits<CR>', { silent = true })
map('n', '<Leader>fgb', '<Cmd>FzfLua git_branches<CR>', { silent = true })
map(
  'n',
  '<Leader>fe',
  "<Cmd>lua require'fzf-lua'.grep_project({ fzf_cli_args = '--nth 2..' })<CR>",
  { silent = true }
)
