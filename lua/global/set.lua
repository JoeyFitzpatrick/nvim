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
vim.opt.cmdheight = 2

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

-- Saved macros, useful for persisting macros
vim.cmd([[
    :let @a = "iHello\<CR>bye\<Esc>"
]])

vim.cmd([[ 
    :iabbrev flase false
]])
