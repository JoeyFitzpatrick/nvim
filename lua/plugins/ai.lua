return {
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							commands = {
								default = { "env", "-u", "ANTHROPIC_API_KEY", "claude-agent-acp" },
							},
						})
					end,
				},
			},
			interactions = {
				chat = { adapter = "claude_code" },
			},
		},
	},
}
