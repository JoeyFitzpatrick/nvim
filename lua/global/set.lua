vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.number = true
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
vim.opt.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- Saved macros
vim.cmd([[
    :let @a = '_vg_sa"A,' . "\<Esc>j"
]])

vim.cmd([[ 
    :iabbrev flase false
]])
