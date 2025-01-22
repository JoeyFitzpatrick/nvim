return {
	{ "tpope/vim-fugitive", enabled = true },
	{
		dir = "~/plugins/ever.nvim",
		name = "ever",
		enabled = true,
		config = function()
			vim.keymap.set("n", "g<space>", ":G ", { desc = "Ever Prefix" })
		end,
	},
	{
		dir = "~/plugins/alien.nvim",
		name = "alien",
		enabled = false,
		config = function()
			vim.g.alien_configuration = { command_mode_commands = { "G" } }
			require("alien").setup()
			nmap("gs", "<cmd>G status<CR>", "Alien Status")
			nmap("gb", "<cmd>G branch<CR>", "Alien Branches")
			nmap("g<space>", ":G ", "Alien Prefix")
		end,
	},
	{
		"sindrets/diffview.nvim",
		enabled = true,
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>jd", "<cmd>DiffviewOpen<CR>")
			require("diffview").setup({
				view = {
					merge_tool = {
						layout = "diff3_mixed",
					},
				},
			})
		end,
	},
}
