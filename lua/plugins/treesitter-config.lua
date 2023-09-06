return {
		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
		cond = not_vscode,
		lazy = false,
		dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
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
					"vue",
				},

				context_commentstring = {
					enable = true,
				},
			})
		end,
	},
 {
    "nvim-treesitter/nvim-treesitter-textobjects",
    cond = vim.g.vscode == nil,
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        -- You can optionally set descriptions to the mappings (used in the desc parameter of
                        -- nvim_buf_set_keymap) which plugins like which-key display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        ["il"] = { query = "@block.inner", desc = "Select inner block" },
                        ["al"] = { query = "@scoblock.outer", desc = "Select outer block" },
                    },
                },
            },
        })
    end,
}
