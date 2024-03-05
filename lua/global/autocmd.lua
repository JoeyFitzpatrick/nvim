local last_position_group = vim.api.nvim_create_augroup("OpenAtLastPosition", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	command = 'silent! normal! g`"zv',
	group = last_position_group,
})

-- local insert_mode_group = vim.api.nvim_create_augroup("InsertModeGroup", { clear = true })
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	desc = "Highlight the current line only in insert mode",
-- 	pattern = "*",
-- 	command = "hi CursorLine guibg=#24332c",
-- 	group = insert_mode_group,
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	desc = "un-highlight the current line after leaving insert mode",
-- 	pattern = "*",
-- 	command = "hi CursorLine guibg=#282837",
-- 	group = insert_mode_group,
-- })
