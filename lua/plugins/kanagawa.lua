return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd("colorscheme tokyonight-storm")
		function light()
			vim.cmd("set background=light | colorscheme tokyonight-day")
		end
		function dark()
			vim.cmd("set background=dark | colorscheme tokyonight-storm")
		end
		vim.cmd("command Light silent lua light()")
		vim.cmd("command Dark silent lua dark()")
	end,
}
