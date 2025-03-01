return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = { enabled = false },
		popupmenu = { enabled = false },
		notify = { enabled = false },
		presets = {
			bottom_search = true,
			command_palette = true,
		},
	},
	dependencies = { "MunifTanjim/nui.nvim" },
}
