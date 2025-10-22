-- Make <tab> insert 4 spaces
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Copy indent from current line when starting new line
vim.o.autoindent = true
vim.o.smartindent = true

-- Always display signcolumn for consistent spacing
vim.o.signcolumn = "yes"

-- Line numbers
vim.o.number = true

-- Smart case: ignore case for searches unless capital letter used
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep 8 lines between cursor and edge of screen
vim.o.scrolloff = 8

-- Persistent undo history
vim.o.undofile = true

-- Configure how new splits should be opened
vim.o.splitright = false
vim.o.splitbelow = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }

vim.o.completeopt = "menuone,noselect,popup,fuzzy"
vim.o.updatetime = 300
vim.o.cursorline = true
vim.o.shortmess = "atF" -- abbreviate messages and truncate file messages in cmd line
require("vim._extui").enable({})
vim.o.cmdheight = 0
vim.o.mouse = "a"
vim.o.breakindent = true

vim.o.laststatus = 3
vim.o.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"
vim.o.wrap = true

-- Saved macros
vim.cmd([[
    :let @a = "_vg_sa'A," . "\<Esc>j"
]])

vim.cmd([[ 
    :iabbrev flase false
    :iabbrev teh the
]])
