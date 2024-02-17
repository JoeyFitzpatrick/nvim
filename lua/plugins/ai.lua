return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		-- commit = "d4aa4d9e31d620a0c01006e59f4449ffc7eb33ce",
		config = function()
			require("chatgpt").setup({ openai_params = { model = "gpt-4" } })
		end,
		keys = {
			{ "<leader>ag", ":ChatGPT<CR>", { desc = "Open GPT prompt" } },
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
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
}
