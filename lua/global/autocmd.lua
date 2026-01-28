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

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- yankring
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankRing", { clear = true }),
	callback = function()
		if vim.v.event.operator == "y" then
			for i = 9, 1, -1 do -- Shift all numbered registers.
				vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
			end
		end
	end,
})
