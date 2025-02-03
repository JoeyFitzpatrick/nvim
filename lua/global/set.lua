vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
-- need both of these for hybrid line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.undofile = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.updatetime = 300
vim.opt.cursorline = true
vim.opt.shortmess = "at" -- abbreviate messages and truncate file messages in cmd line
vim.opt.cmdheight = 1
vim.opt.laststatus = 3

-- Saved macros
vim.cmd([[
    :let @a = '_vg_sa"A,' . "\<Esc>j"
]])

vim.cmd([[ 
    :iabbrev flase false
]])
