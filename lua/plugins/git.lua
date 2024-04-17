return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = { { "<leader>kl", "<cmd>Git blame -w -C -C -C<CR>", desc = "Git B[l]ame (with helpful args)" } },
	},
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
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}
