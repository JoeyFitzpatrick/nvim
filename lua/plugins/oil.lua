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
		nmap("-", "<cmd>Oil --float<cr>", "Oil")
	end,
}
