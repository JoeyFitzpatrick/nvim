return {
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup({
				date_format = "%m/%d/%Y",
			})
		end,
		keys = {
			{ "<leader>kl", "<cmd>BlameToggle<CR>", desc = "Toggle blame window" },
			{ "<leader>kL", "<cmd>BlameToggle virtual<CR>", desc = "Toggle virtual blame" },
		},
	},
	{ "tpope/vim-fugitive" },
}
