return {
	"echasnovski/mini.nvim",
	version = false,
	opts = {},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
	config = function()
		require("mini.icons").setup()
		require("mini.surround").setup()

		local spec_treesitter = require("mini.ai").gen_spec.treesitter
		require("mini.ai").setup({
			custom_textobjects = {
				f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
				c = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
				o = spec_treesitter({
					a = { "@conditional.outer", "@loop.outer" },
					i = { "@conditional.inner", "@loop.inner" },
				}),
			},
		})
	end,
}
