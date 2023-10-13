return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	commit = "d4aa4d9e31d620a0c01006e59f4449ffc7eb33ce",
	config = function()
		require("chatgpt").setup({ openai_params = { model = "gpt-4" } })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
