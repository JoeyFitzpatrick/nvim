local last_position_group = vim.api.nvim_create_augroup("OpenAtLastPosition", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	command = 'silent! normal! g`"zv',
	group = last_position_group,
})

local html_filetype_group = vim.api.nvim_create_augroup("UpdateHtmlFiletype", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	desc = "Change html filetypes to htmldjango",
	pattern = { "html", "htmlangular" },
	callback = function()
		vim.bo.filetype = "htmldjango"
	end,
	group = html_filetype_group,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "TermOpen" }, {
	desc = "Auto insert mode when entering terminal",
	group = vim.api.nvim_create_augroup("AutoInsertTerminal", { clear = true }),
	pattern = "term://*",
	command = "startinsert",
})

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
