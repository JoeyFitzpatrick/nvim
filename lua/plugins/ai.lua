return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = false,
				},
			})
			local suggestion = require("copilot.suggestion")
			vim.keymap.set("i", "<M-n>", suggestion.next)
			vim.keymap.set("i", "<M-p>", suggestion.prev)
			vim.keymap.set("i", "<M-y>", suggestion.accept)
		end,
	},
}
