return {
	"echasnovski/mini.nvim",
	version = false,
	opts = {},
	lazy = true,
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function()
		require("mini.icons").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
	end,
}
