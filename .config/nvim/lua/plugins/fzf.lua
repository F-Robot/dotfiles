local fzf_lua = require('fzf-lua')
local map = require('utils/utils').map

fzf_lua.setup({
  winopts = {
    preview = {
      default = 'bat_native',
      scrollbar = 'float',
      delay = 0,
      border = 'noborder',
    },
  },
  files = {
    git_icons = false,
    fd_opts = '--color=never --type f --hidden --follow --exclude={.git,*.jpg,*jpeg,*.png,*.pdf}',
  },
})
-- FZF Mapping
map('n', '<Leader>F', '<Cmd>FzfLua<CR>', { silent = true })
map('n', '<Leader>fl', '<Cmd>FzfLua grep_last<CR>', { silent = true })
map('n', '<Leader>ff', '<Cmd>FzfLua files<CR>', { silent = true })
map('n', '<Leader>fs', '<Cmd>FzfLua git_status<CR>', { silent = true })
map('n', '<Leader>fa', '<Cmd>FzfLua git_stash<CR>', { silent = true })
map('n', '<Leader>fc', '<Cmd>FzfLua git_commits<CR>', { silent = true })
map('n', '<Leader>fm', '<Cmd>FzfLua marks<CR>', { silent = true })
map('n', '<Leader>fj', '<Cmd>FzfLua jumps<CR>', { silent = true })
map(
  'n',
  '<Leader>fg',
  "<Cmd>lua require'fzf-lua'.grep_project({ fzf_cli_args = '--nth 2..' })<CR>",
  { silent = true }
)
