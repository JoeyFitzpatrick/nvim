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
	{
		"rhysd/git-messenger.vim",
		cmd = "GitMessenger",
		keys = { { "<leader>km", "<cmd>GitMessenger<CR>", { desc = "Git messenger" } } },
		config = function()
			vim.g.git_messenger_no_default_mappings = true
		end,
	},
}
