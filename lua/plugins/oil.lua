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
		Nmap("-", "<cmd>Oil --float<cr>", "Oil")
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { noremap = true, silent = true })
			end,
		})
	end,
}
