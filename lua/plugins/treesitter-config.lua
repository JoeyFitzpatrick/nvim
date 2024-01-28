return {
	"nvim-treesitter/nvim-treesitter",
	cmd = "TSUpdate",
	event = "VeryLazy",
	-- commit = "cc360a9beb1b30d172438f640e2c3450358c4086",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		require("ts_context_commentstring").setup({})
		vim.g.skip_ts_context_commentstring_module = true
		require("nvim-treesitter.configs").setup({
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>",
					node_incremental = "<Enter>",
					node_decremental = "<BS>",
				},
			},
			ensure_installed = {
				"css",
				"html",
				"javascript",
				"lua",
				"python",
				"scss",
				"svelte",
				"tsx",
				"typescript",
				"vim",
			},
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer", desc = "Select outer function" },
						["if"] = { query = "@function.inner", desc = "Select inner function" },
						["ac"] = { query = "@class.outer", desc = "Select outer class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						["as"] = { query = "@statement.outer", desc = "Select outer statement" },
						["il"] = { query = "@block.inner", desc = "Select inner block" },
						["al"] = { query = "@block.outer", desc = "Select outer block" },
					},
				},
			},
		})
	end,
}
