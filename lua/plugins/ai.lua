return {
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			require("copilot").setup({
				suggestion = { auto_trigger = false, keymap = { next = "<M-j>", prev = "<M-k>", accept = "<M-l>" } },
			})
			vim.keymap.set("n", "<leader>ap", function()
				vim.cmd("Copilot panel")

				vim.keymap.set("n", "<enter>", function()
					require("copilot.panel").accept()
				end, { buffer = 0, desc = "Accept current copilot suggestion" })

				vim.keymap.set("n", "q", function()
					vim.cmd("bd")
				end, { buffer = 0, desc = "Close current buffer" })
			end, { desc = "Open copilot suggestions panel" })
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {},
		config = function()
			require("CopilotChat").setup({ model = "claude-3.5-sonnet" })
			vim.keymap.set("n", "<leader>ac", "<cmd>CopilotChatToggle<CR>", { desc = "Open copilot chat" })
		end,
	},
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
			require("gp").setup({
				providers = {
					anthropic = {
						disable = false,
					},
					openai = {
						disable = true,
					},
				},
			})
		end,
	},
}
