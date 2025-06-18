vim.o.wrap = true

vim.keymap.set("n", "<leader>l", function()
	vim.api.nvim_feedkeys("<leader>p", "n", false)
end)
