vim.g.mapleader = " "

-- Cursor
vim.opt.guicursor = ""
vim.opt.cursorline = false
vim.opt.scrolloff = 10

-- Columns
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "1"

-- Folds
vim.opt.viewoptions:remove("curdir,options")
vim.opt.viewoptions:append("folds")

-- Indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = false
vim.opt.breakindent = true

-- Chars
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "_" }
vim.opt.fillchars = { eob = " ", lastline = " " }

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Timeout
vim.opt.timeoutlen = 250
vim.opt.updatetime = 250

-- Others
vim.opt.wrap = false
-- vim.opt.mouse = ""
vim.opt.mousemodel = "extend"
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.winborder = "single"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Auto-session
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
