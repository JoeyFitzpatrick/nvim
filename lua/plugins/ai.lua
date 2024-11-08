return {
	{
		"robitx/gp.nvim",
		keys = {
			{ "<leader>ag", "<cmd>GpChatToggle<CR>", desc = "Open GPT Prompt" },
			{ "<leader>aG", "<cmd>GpChatFinder<CR>", desc = "Open GPT Chat Finder" },
		},
		cmd = {
			"GpChatToggle",
			"GpChatFinder",
			"GpNextAgent",
			"GpChatNew",
		},
		config = function()
			require("gp").setup()
		end,
	},
}
