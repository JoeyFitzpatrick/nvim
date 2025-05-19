vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hlsearch = false
vim.o.number = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 8
vim.o.undofile = true
vim.o.completeopt = "menuone,noselect,popup"
vim.o.updatetime = 300
vim.o.cursorline = true
vim.o.shortmess = "at" -- abbreviate messages and truncate file messages in cmd line
require("vim._extui").enable({})
vim.o.cmdheight = 0

vim.o.laststatus = 3
vim.o.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

-- Saved macros
vim.cmd([[
    :let @a = "_vg_sa'A," . "\<Esc>j"
]])

vim.cmd([[ 
    :iabbrev flase false
]])
