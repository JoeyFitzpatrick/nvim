return {
	{ "tpope/vim-fugitive", cmd = { "Git", "G" } },
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = function()
			require("diffview").setup({})
			vim.keymap.set(
				"n",
				"<leader>kh",
				"<cmd>DiffviewFileHistory %<CR>",
				{ silent = true, desc = "File history" }
			)
		end,
	},
}
