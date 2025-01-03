return {
	{ "tpope/vim-fugitive", enabled = true },
	{
		dir = "~/plugins/alien.nvim",
		name = "alien",
		enabled = true,
		config = function()
			vim.g.alien_configuration = { command_mode_commands = { "G" } }
			require("alien").setup()
			nmap("<leader>s", "<cmd>G status<CR>", "Alien Status")
			nmap("<leader>b", "<cmd>G branch<CR>", "Alien Branches")
			nmap("gb", "<cmd>G blame<CR>", "Alien Blame")
			nmap("gs", "<cmd>G stash list<CR>", "Alien Stash")
		end,
	},
	{
		"sindrets/diffview.nvim",
		enabled = true,
		event = "VeryLazy",
	},
}
