local group = vim.api.nvim_create_augroup("CmdlineCompletion", { clear = true })

vim.opt.wildmode = "noselect:lastused,full"
vim.keymap.set("c", "<C-n>", "<End><C-U><Up>", { silent = true })
vim.keymap.set("c", "<C-p>", "<End><C-U><Down>", { silent = true })

vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = group,
	desc = "Auto show command line completion",
	pattern = ":",
	callback = function()
		vim.fn.wildtrigger()
	end,
})
