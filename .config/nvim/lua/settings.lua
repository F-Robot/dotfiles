local opt = vim.opt
local env = vim.env
local fn = vim.fn
local g = vim.g
local o = vim.o

-- Map Leader
g.mapleader = ','

-- Color scheme
opt.termguicolors = true -- Enables 24-bit RGB color support.
opt.grepprg = 'rg --vimgrep --smart-case --hidden'
opt.grepformat = '%f:%l:%c:%m'

-- Global Options
opt.startofline = true -- Move cursor to the start of each line when jumping with certain commands.
opt.ignorecase = true -- Ignore case in search patterns.
opt.smartcase = true -- Set 'noignorecase' if search pattern contains an uppercase letter.
opt.scrolloff = 5 -- Minimum number of screen lines to keep above and below the cursor.
opt.sidescroll = 5 -- Columns to scroll horizontally when cursor is moved off the screen.
opt.sidescrolloff = 5 -- Minimum number of screen columns to keep to cursor right.
opt.laststatus = 0 -- Disable status-line.
opt.statusline = ' ' -- Disable built-in status-line string for splits.
opt.updatetime = 500 -- Trigger CursorHold event faster.
opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete.
opt.undolevels = 100000 -- Maximum number of changes that can be undone.
opt.splitbelow = true -- Splitting a window will put the new window below of the current one.
opt.splitright = true -- Splitting a window will put the new window right of the current one.
opt.ruler = false -- Disable showing line and column numbers in command line.
opt.pumheight = 5 -- Maximum number of items to show in the popup menu.
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'.
opt.showcmd = true -- Disable displaying key presses at the right bottom.
opt.showmode = false -- Disable native mode indicator.
opt.clipboard = 'unnamedplus'
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
opt.fillchars = { -- Characters to be used in various user-interface elements.
  stl = ' ', -- Status-line of the current window.
  stlnc = ' ', -- Status-line of the non-current windows.
  vert = ' ', -- Vertical separator to be used with :vsplit.
  fold = ' ', -- Character to be used with 'foldtext'.
  diff = '╱', -- Deleted lines of the 'diff' option.
  msgsep = '─', -- Message separator for 'display' option.
  eob = ' ', -- Empty lines at the end of a buffer.
}
opt.diffopt = { -- Option settings for diff mode.
  'filler', -- Show filler lines.
  'vertical', -- Start diff mode with vertical splits.
  'hiddenoff', -- Do not use diff mode for a buffer when it becomes hidden.
  'foldcolumn:0', -- Set the 'foldcolumn' option to 0.
  'algorithm:histogram', -- Use the specified diff algorithm.
}
opt.completeopt = { -- Options for insert mode completion.
  'menu', -- Use the pop-up menu.
  'menuone', -- Use the pop-up menu also when there is only one match.
  'noselect', -- Use the pop-up menu also when there is only one match.
}

-- Window Options
--opt.breakindent = true -- Wrapped lines will be visually indented with same amount of space.
--opt.wrap = false -- Prevent wrapping for long lines.
--opt.linebreak = true -- Wrap long lines at a character in 'breakat'.
--opt.foldmethod = 'indent' -- Use indent folding method to fold lines.
opt.signcolumn = 'yes' -- Always draw the sign column even there is no sign in it.
opt.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
opt.relativenumber = true -- Persist undo history to an undo file.
opt.number = true -- Persist undo history to an undo file.

-- Buffer Options
opt.modeline = false -- Disable modeline feature altogether.
opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
opt.shiftwidth = 2 -- Number of spaces to use for each step of auto indent.
opt.softtabstop = 0 -- Number of spaces that a <Tab> counts.
opt.expandtab = true -- Use spaces instead of tab characters.
opt.undofile = true -- Persist undo history to an undo file.
opt.swapfile = false

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
g.loaded_2html_plugin = true
g.loaded_vimballPlugin = true
g.loaded_getscriptPlugin = true
g.loaded_logipat = true
g.loaded_tutor_mode_plugin = true
g.loaded_matchit = true

function _G.qftf(info)
  local items
  local ret = {}
  if info.quickfix == 1 then
    items = fn.getqflist({ id = info.id, items = 0 }).items
  else
    items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
  end
  local limit = 31
  local fname_fmt1, fname_fmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
  local valid_fmt = '%s │%5d:%-3d│%s %s'
  for i = info.start_idx, info.end_idx do
    local e = items[i]
    local fname = ''
    local str
    if e.valid == 1 then
      if e.bufnr > 0 then
        fname = fn.bufname(e.bufnr)
        if fname == '' then
          fname = '[No Name]'
        else
          fname = fname:gsub('^' .. vim.env.HOME, '~')
        end
        -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
        if #fname <= limit then
          fname = fname_fmt1:format(fname)
        else
          fname = fname_fmt2:format(fname:sub(1 - limit))
        end
      end
      local lnum = e.lnum > 99999 and -1 or e.lnum
      local col = e.col > 999 and -1 or e.col
      local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
      str = valid_fmt:format(fname, lnum, col, qtype, e.text)
    else
      str = e.text
    end
    table.insert(ret, str)
  end
  return ret
end

opt.qftf = ' '
o.qftf = '{info -> v:lua._G.qftf(info)}'
