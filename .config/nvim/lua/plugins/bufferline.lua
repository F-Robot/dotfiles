local bufferline = require('bufferline')
local map = require('utils/utils').map

local diagnostics_indicator = function(count, level, diagnostics_dict)
  local s = ' '
  for e, n in pairs(diagnostics_dict) do
    local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
    s = s .. n .. sym
  end
  return s
end

bufferline.setup({
  options = {
    show_close_icon = false,
    indicator_icon = '',
    tab_size = 20,
    diagnostics = 'nvim_lsp',
    modified_icon = '🞄',
    enforce_regular_tabs = true,
    separator_style = 'thin',
    diagnostics_indicator = diagnostics_indicator,
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
      },
    },
  },
})

map('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { silent = true })
map('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { silent = true })
map('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { silent = true })
map('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { silent = true })
map('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { silent = true })
map('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { silent = true })
map('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { silent = true })
map('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { silent = true })
map('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>', { silent = true })
