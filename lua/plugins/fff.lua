return {
	"dmtrKovalenko/fff.nvim",
	lazy = false,
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		title = "Files",
		layout = {
			height = 0.90,
			width = 0.90,
			preview_position = "bottom",
			preview_size = 0.45,
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				require("fff").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>g",
			function()
				require("fff").live_grep({ cwd = vim.fs.root(0, ".git") })
			end,
			desc = "Grep",
		},
		{
			"<leader>g",
			function()
				require("fff").live_grep_under_cursor()
			end,
			mode = "x",
			desc = "Grep visual selection",
		},
		{
			"<leader>ep",
			function()
				require("fff").find_files_in_dir("~/.local/share/nvim/lazy")
			end,
			desc = "Edit Plugins",
		},
		{
			"<leader>eg",
			function()
				require("fff").live_grep({ cwd = "~/.local/share/nvim/lazy" })
			end,
			desc = "Grep Plugins",
		},
		{
			"<leader>er",
			function()
				require("fff").find_files_in_dir("~/.config/scripts")
			end,
			desc = "Edit Rest Request Files",
		},
		{
			"<leader><leader>g",
			function()
				require("fff").resume()
			end,
			desc = "Resume",
		},
	},
}
