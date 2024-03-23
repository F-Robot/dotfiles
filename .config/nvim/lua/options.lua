local g = vim.g
local opt = vim.opt
local env = vim.env

-- Global
g.mapleader = ','
g.autoformat = true
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
g.markdown_recommended_style = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Options
opt.autowrite = true
opt.termguicolors = true
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.list = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 2
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 2
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
opt.iskeyword = '@,48-57,_,192-255,-'
opt.ruler = false
opt.startofline = true
opt.report = 1000
opt.sidescroll = 5
opt.ttimeoutlen = 0
opt.hlsearch = true
opt.showcmd = false
opt.breakindent = true
opt.linebreak = true
opt.softtabstop = -1
opt.showmode = false
opt.statusline = ' '
opt.modeline = false
opt.laststatus = 0
opt.cmdheight = 0

opt.fillchars = {
  stl = ' ',
  stlnc = ' ',
  vert = ' ',
  diff = '╱',
  msgsep = '─',
  eob = ' ',
}

opt.listchars = {
  tab = '│ ',
  nbsp = '␣',
  extends = '·',
  precedes = '·',
}

opt.shortmess =
    table.concat({
      'f',
      'i',
      'l',
      'm',
      'n',
      'r',
      'w',
      'x',
      'o',
      'O',
      's',
      't',
      'T',
      'I',
      'c',
      'F',
    })

if not vim.g.vscode then
  opt.timeoutlen = 300
end

if not vim.env.SSH_TTY then
  opt.clipboard = "unnamedplus"
end

if env.SUDO_USER ~= nil then
  opt.swapfile = false
  opt.backup = false
  opt.writebackup = false
  opt.undofile = false
  opt.shada = ''
end

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
