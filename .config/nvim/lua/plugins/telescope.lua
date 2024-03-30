local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { preview_width = 0.6, width = 0.8 },
    },
    prompt_prefix = ' ',
    selection_caret = ' ',
    mappings = {
      i = {
        ['<C-n>'] = actions.preview_scrolling_down,
        ['<C-p>'] = actions.preview_scrolling_up,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<Esc>'] = actions.close,
      },
    },
  },
})

local builtin = require('telescope.builtin')
local map = vim.keymap.set

map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fc', builtin.git_commits, {})
map('n', '<leader>fd', builtin.git_bcommits, {})
map('n', '<leader>fs', builtin.git_status, {})
map('n', '<leader>fp', builtin.planets, {})
