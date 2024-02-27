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
	{
		"bakks/butterfish.nvim",
		keys = {
			{ "<leader>ap", "<cmd>BFFilePrompt ", desc = "Butterfish File Prompt" },
			{ "<leader>ar", "<cmd>BFRewrite ", mode = { "n", "v" }, desc = "Butterfish Rewrite" },
			{ "<leader>ac", "<cmd>BFComment<CR>", mode = { "n", "v" }, desc = "Butterfish Comment" },
			{ "<leader>ae", "<cmd>BFExplain<CR>", mode = { "n", "v" }, desc = "Butterfish Explain" },
			{ "<leader>af", "<cmd>BFFix<CR>", desc = "Butterfish Fix" },
			{ "<leader>ai", "<cmd>BFImplement<CR>", desc = "Butterfish Implement" },
			{ "<leader>ad", "<cmd>BFEdit ", desc = "Butterfish Edit" },
			{ "<leader>aq", "<cmd>BFQuestion ", desc = "Butterfish Question" },
		},
		config = function()
			require("butterfish")
		end,
		dependencies = { "tpope/vim-commentary" },
	},
	{ "github/copilot.vim", lazy = false, event = "VeryLazy" },
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {},
		keys = {
			{
				"gw",
				mode = { "n", "x" },
				function()
					require("wtf").ai()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				mode = { "n" },
				"gW",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
		},
	},
}
