return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		require("telescope").load_extension("live_grep_args")
        require('telescope').load_extension("macros")
		local builtin = require("telescope.builtin")
		require("telescope").setup({
			defaults = {
				layout_config = {
					vertical = { width = 0.9 },
				},
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<C-q>"] = builtin.quickfix,
						["<C-a>"] = require("telescope-harpoon").mark_file,
					},
				},
			},
		})
	end,
}
