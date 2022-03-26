local env = vim.env
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

-- Mapleader
g.mapleader = ','

-- Autocmds
cmd([[source ~/.config/nvim/lua/autocmds.vim]])

-- Color scheme
opt.termguicolors = true -- Enables 24-bit RGB color support.
g.tokyonight_transparent = true -- Disable background color
g.tokyonight_hide_inactive_statusline = true -- Hide inactive statuslines
cmd([[colorscheme tokyonight]]) -- Colorscheme TokyoNight

-- Buffer Options
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
opt.shiftwidth = 2 -- Number of spaces to use for each step of auto indent.
opt.expandtab = true -- Use spaces instead of tab characters.
opt.undofile = true -- Persist undo history to an undo file.
opt.swapfile = false

-- Window Options
opt.signcolumn = 'yes' -- Always draw the sign column even there is no sign in it.
opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
opt.relativenumber = true -- Persist undo history to an undo file.
opt.number = true -- Persist undo history to an undo file.

-- Global Options
opt.laststatus = 0 -- Disable status-line.
opt.statusline = '' -- Disable built-in status-line string for splits.
opt.ignorecase = true -- Ignore case in search patterns.
opt.smartcase = true -- Set 'noignorecase' if search pattern contains an uppercase letter.
opt.scrolloff = 5 -- Minimum number of screen lines to keep above and below the cursor.
opt.sidescroll = 5 -- Columns to scroll horizontally when cursor is moved off the screen.
opt.sidescrolloff = 5 -- Minimum number of screen columns to keep to cursor right.
opt.pumheight = 7 -- Maximum number of items to show in the popup menu.
opt.updatetime = 500 -- Trigger CursorHold event faster.
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete.
opt.undolevels = 100000 -- Maximum number of changes that can be undone.
opt.splitbelow = true -- Splitting a window will put the new window below of the current one.
opt.splitright = true -- Splitting a window will put the new window right of the current one.
opt.ruler = false -- Disable showing line and column numbers in command line.
opt.shortmess =
  table.concat({ -- Use abbreviations and short messages in command menu line.
    'f', -- Use "(3 of 5)" instead of "(file 3 of 5)".
    'i', -- Use "[noeol]" instead of "[Incomplete last line]".
    'l', -- Use "999L, 888C" instead of "999 lines, 888 characters".
    'm', -- Use "[+]" instead of "[Modified]".
    'n', -- Use "[New]" instead of "[New File]".
    'r', -- Use "[RO]" instead of "[readonly]".
    'x', -- Use "[dos]", "[unix]", "[mac]" instead of "[dos format]", "[unix format]", "[mac format]".
    'o', -- Overwrite message for writing a file with subsequent message.
    'O', -- Message for reading a file overwrites any previous message.
    's', -- Disable "search hit BOTTOM, continuing at TOP" such messages.
    't', -- Truncate file message at the start if it is too long.
    'T', -- Truncate other messages in the middle if they are too long.
    'I', -- Don't give the :intro message when starting.
    'c', -- Don't give ins-completion-menu messages.
    'F', -- Don't give the file info when editing a file.
  })

-- Root
if env.SUDO_USER ~= nil then
  opt.swapfile = false
  opt.backup = false
  opt.writebackup = false
  opt.undofile = false
  opt.shada = ''
end
-- Disable builtint plugins
g.loaded_gzip = true
g.loaded_rrhelper = true
g.loaded_tarPlugin = true
g.loaded_zipPlugin = true
g.loaded_netrwPlugin = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwSettings = true
g.loaded_vimballPlugin = true
g.loaded_getscriptPlugin = true
g.loaded_logipat = true
g.loaded_tutor_mode_plugin = true
