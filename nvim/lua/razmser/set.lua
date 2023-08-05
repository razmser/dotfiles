vim.opt.number  = true
vim.opt.relativenumber  = true

-- highlight current line
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- no backups and annoying swp files
vim.opt.swapfile = false
vim.opt.backup = false
-- persistent undo history
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
vim.opt.undofile = true

-- proper colors
vim.opt.termguicolors = true
-- faster updatetime
vim.opt.updatetime = 50

vim.opt.scrolloff = 8


-- set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
