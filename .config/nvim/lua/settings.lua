local env = vim.env
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

-- Autocmds
cmd([[source ~/.config/nvim/lua/autocmds.vim]])

-- Mapleader
g.mapleader = ","
g.python3_host_prog = "/user/bin/python3"

-- Tokyonight
vim.cmd([[colorscheme tokyonight]])

-- Color scheme
opt.termguicolors = true

-- Buffer Options
opt.tabstop = 2
opt.shiftwidth = 2
opt.undofile = true
opt.swapfile = false
opt.expandtab = true
opt.autowrite = true
opt.iskeyword = "@,48-57,_,192-255,-"

-- Window Options
opt.number = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.relativenumber = true

-- Global Options
opt.scrolloff = 5
opt.pumheight = 5
opt.sidescroll = 5
opt.sidescrolloff = 5

opt.ruler = false
opt.smartcase = true
opt.ignorecase = true

opt.laststatus = 0
opt.statusline = ""

opt.ttimeoutlen = 10
opt.updatetime = 500
opt.timeoutlen = 500
opt.undolevels = 1000
opt.splitbelow = true
opt.splitright = true

opt.shortmess = table.concat({ -- Use abbreviations and short messages in command menu line.
	"f", -- Use "(3 of 5)" instead of "(file 3 of 5)".
	"i", -- Use "[noeol]" instead of "[Incomplete last line]".
	"l", -- Use "999L, 888C" instead of "999 lines, 888 characters".
	"m", -- Use "[+]" instead of "[Modified]".
	"n", -- Use "[New]" instead of "[New File]".
	"r", -- Use "[RO]" instead of "[readonly]".
	"x", -- Use "[dos]", "[unix]", "[mac]" instead of "[dos format]", "[unix format]", "[mac format]".
	"o", -- Overwrite message for writing a file with subsequent message.
	"O", -- Message for reading a file overwrites any previous message.
	"s", -- Disable "search hit BOTTOM, continuing at TOP" such messages.
	"t", -- Truncate file message at the start if it is too long.
	"T", -- Truncate other messages in the middle if they are too long.
	"I", -- Don't give the :intro message when starting.
	"c", -- Don't give ins-completion-menu messages.
	"F", -- Don't give the file info when editing a file.
})
-- Root
if env.SUDO_USER ~= nil then
	opt.swapfile = false
	opt.backup = false
	opt.writebackup = false
	opt.undofile = false
	opt.shada = ""
end
-- Disable builtint plugins
g.loaded_gzip = true
g.loaded_logipat = true
g.loaded_rrhelper = true
g.loaded_tarPlugin = true
g.loaded_zipPlugin = true
g.loaded_netrwPlugin = true
g.loaded_netrwSettings = true
g.loaded_vimballPlugin = true
g.loaded_getscriptPlugin = true
g.loaded_netrwFileHandlers = true
g.loaded_tutor_mode_plugin = true
