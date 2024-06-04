return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = { show_hidden = true },
			experimental_watch_for_changes = true,
			skip_confirm_for_simple_edits = true,
		})
		nmap("-", "<cmd>Oil --float<cr>", "Oil")
	end,
}
