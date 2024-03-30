local icons = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' ',
}

require('bufferline').setup({
  options = {
    separator_style = 'slope',
    diagnostics_update_in_insert = false,
    close_command = function(n)
      require('mini.bufremove').delete(n, false)
    end,
    right_mouse_command = function(n)
      require('mini.bufremove').delete(n, false)
    end,
    diagnostics = 'nvim_lsp',
    always_show_bufferline = true,
    offsets = {
      {
        filetype = 'NvimTree',
        highlight = 'Directory',
        text = 'File Explorer',
      },
    },
    diagnostics_indicator = function(_, _, diag)
      local ret = (diag.error and icons.Error .. diag.error .. ' ' or '')
        .. (diag.warning and icons.Warn .. diag.warning or '')
      return vim.trim(ret)
    end,
  },
})

local map = vim.keymap.set

map(
  'n',
  '<leader>cp',
  '<Cmd>BufferLineTogglePin<CR>',
  { desc = 'Pin Buffer', remap = true }
)
map(
  'n',
  '<leader>co',
  '<Cmd>BufferLineCloseOthers<CR>',
  { desc = 'Delete Other Buffers', remap = true }
)
map(
  'n',
  '<leader>cr',
  '<Cmd>BufferLineCloseRight<CR>',
  { desc = 'Delete Buffers to the Right', remap = true }
)
map(
  'n',
  '<leader>cl',
  '<Cmd>BufferLineCloseLeft<CR>',
  { desc = 'Delete Buffers to the Left', remap = true }
)
map('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', { silent = true })
map('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', { silent = true })
map('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', { silent = true })
map('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', { silent = true })
map('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', { silent = true })
map('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', { silent = true })
map('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', { silent = true })
map('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', { silent = true })
map('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', { silent = true })

--   icons = {
--     misc = {
--       dots = "󰇘",
--     },
--     dap = {
--       Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
--       Breakpoint          = " ",
--       BreakpointCondition = " ",
--       BreakpointRejected  = { " ", "DiagnosticError" },
--       LogPoint            = ".>",
--     },
--     git = {
--       added    = " ",
--       modified = " ",
--       removed  = " ",
--     },
--     kinds = {
--       Array         = " ",
--       Boolean       = "󰨙 ",
--       Class         = " ",
--       Codeium       = "󰘦 ",
--       Color         = " ",
--       Control       = " ",
--       Collapsed     = " ",
--       Constant      = "󰏿 ",
--       Constructor   = " ",
--       Copilot       = " ",
--       Enum          = " ",
--       EnumMember    = " ",
--       Event         = " ",
--       Field         = " ",
--       File          = " ",
--       Folder        = " ",
--       Function      = "󰊕 ",
--       Interface     = " ",
--       Key           = " ",
--       Keyword       = " ",
--       Method        = "󰊕 ",
--       Module        = " ",
--       Namespace     = "󰦮 ",
--       Null          = " ",
--       Number        = "󰎠 ",
--       Object        = " ",
--       Operator      = " ",
--       Package       = " ",
--       Property      = " ",
--       Reference     = " ",
--       Snippet       = " ",
--       String        = " ",
--       Struct        = "󰆼 ",
--       TabNine       = "󰏚 ",
--       Text          = " ",
--       TypeParameter = " ",
--       Unit          = " ",
--       Value         = " ",
--       Variable      = "󰀫 ",
--     },
--   },
--   ---@type table<string, string[]|boolean>?
--   kind_filter = {
--     default = {
--       "Class",
--       "Constructor",
--       "Enum",
--       "Field",
--       "Function",
--       "Interface",
--       "Method",
--       "Module",
--       "Namespace",
--       "Package",
--       "Property",
--       "Struct",
--       "Trait",
--     },
--     markdown = false,
--     help = false,
--     -- you can specify a different filter for each filetype
--     lua = {
--       "Class",
--       "Constructor",
--       "Enum",
--       "Field",
--       "Function",
--       "Interface",
--       "Method",
--       "Module",
--       "Namespace",
--       -- "Package", -- remove package since luals uses it for control flow structures
--       "Property",
--       "Struct",
--       "Trait",
--     },
--   },
-- }
