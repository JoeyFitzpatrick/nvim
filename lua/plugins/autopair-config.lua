return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = "v0.6",
	opts = {
		fastwarp = {
			multi = true,
			{},
			{
				enable_normal = true,
				enable_reverse = true,
                faster = false,
				map = "<C-a>",
				rmap = "<C-s>",
				cmap = "<C-a>",
				rcmap = "<C-s>",
			},
		},
	},
}
