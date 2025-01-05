return {
	{ "tpope/vim-fugitive", enabled = true },
	{
		dir = "~/plugins/alien.nvim",
		name = "alien",
		enabled = true,
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
	},
}
