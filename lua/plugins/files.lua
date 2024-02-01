return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = { width = {} },
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			filters = {
				git_ignored = false,
			},
		})
	end,
}
