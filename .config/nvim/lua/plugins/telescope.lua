local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    get_selection_window = function()
      local wins = vim.api.nvim_list_wins()
      table.insert(wins, 1, vim.api.nvim_get_current_win())
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == '' then
          return win
        end
      end
      return 0
    end,
    mappings = {
      i = {
        ['<C-n>'] = actions.preview_scrolling_down,
        ['<C-p>'] = actions.preview_scrolling_up,

        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
      n = {
        ['q'] = actions.close,
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
