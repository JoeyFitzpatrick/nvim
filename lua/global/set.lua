vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false

vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.o.smartcase = true
vim.opt.autoindent = true
vim.opt.scrolloff = 8

vim.o.undofile = true

vim.o.completeopt = "menuone,noselect"

vim.o.updatetime = 300

vim.opt.cursorline = true
-- vim.cmd([[hi CursorLine guibg=#282837]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.o.cmdheight = 0

-- Saved macros, useful for persisting macros
vim.cmd([[
    :let @a = "iHello\<CR>bye\<Esc>"
]])

vim.cmd([[ 
    :iabbrev flase false
]])
