local fzf_lua = require('fzf-lua')
local map = require('utils/utils').map

fzf_lua.setup({
  winopts = {
    height = 0.90,
    width = 0.65,
    row = 0.30,
    col = 0.50,
    hl = {
      border = 'FloatBorder',
    },
    preview = {
      default = 'bat_native',
      vertical = 'down:60%',
      layout = 'vertical',
      scrollbar = 'float',
    },
  },
  keymap = {
    builtin = {
      ['<F10>'] = 'toggle-preview',
      ['<F11>'] = 'toggle-fullscreen',
      ['<S-Down>'] = 'preview-page-down',
      ['<S-Up>'] = 'preview-page-up',
    },
    fzf = {
      ['ctrl-a'] = 'toggle-all',
      ['ctrl-f'] = 'half-page-down',
      ['ctrl-b'] = 'half-page-up',
    },
  },
  git = {
    files = {
      prompt = '> ',
      git_icons = false,
      file_icons = false,
    },
    status = {
      prompt = 'GitStatus> ',
    },
    commits = {
      prompt = 'Commits> ',
    },
    bcommits = {
      prompt = 'BufferCommits> ',
    },
    branches = {
      prompt = 'Branches> ',
    },
  },
  grep = {
    search = '',
  },
  args = {
    prompt = 'Args> ',
  },
  oldfiles = {
    prompt = 'OldFiles> ',
  },
  buffers = {
    prompt = 'Buffers> ',
  },
  blines = {
    prompt = 'BufferLines> ',
  },
  colorschemes = {
    prompt = 'Colorschemes> ',
  },
  lsp = {
    prompt = '> ',
  },
  helptags = { previewer = { _ctor = false } },
  manpages = { previewer = { _ctor = false } },
})
-- FZF Mapping
map('n', '<Leader>f', '<Cmd>FzfLua<CR>', { silent = true })
map('n', '<Leader>ff', '<Cmd>FzfLua files<CR>', { silent = true })
map(
  'n',
  '<Leader>fg',
  "<Cmd>lua require'fzf-lua'.grep_project({ fzf_cli_args = '--nth 2..' })<CR>",
  { silent = true }
)
