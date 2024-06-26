return {
	-- {
	-- 	"sindrets/diffview.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("diffview").setup({})
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"<leader>kh",
	-- 			"<cmd>DiffviewFileHistory %<CR>",
	-- 			{ silent = true, desc = "File history" }
	-- 		)
	-- 	end,
	-- },
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	cmd = "Neogit",
	-- 	branch = "nightly",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 	},
	-- 	config = true,
	-- },
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
