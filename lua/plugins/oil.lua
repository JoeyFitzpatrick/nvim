return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return name == ".."
				end,
			},
			experimental_watch_for_changes = true,
			skip_confirm_for_simple_edits = true,
		})
		Nmap("-", "<cmd>Oil<CR>", "Oil")
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.keymap.set("n", "q", function()
					vim.api.nvim_buf_delete(0, { force = true })
				end, { noremap = true, silent = true, buffer = 0 })
			end,
		})
	end,
}
