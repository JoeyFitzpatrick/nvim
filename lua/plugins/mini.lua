return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.cursorword").setup()
		require("mini.files").setup({

			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "L",
				go_out = "h",
				go_out_plus = "H",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "<enter>",
				trim_left = "<",
				trim_right = ">",
			},
		})
		vim.keymap.set("n", "-", function()
			MiniFiles.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open MiniFiles" })
	end,
}
