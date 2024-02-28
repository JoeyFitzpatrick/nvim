return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					map("n", "[c", function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end, { expr = true })

					-- Actions
					map("n", "Hs", gs.stage_hunk, { desc = "stage hunk" })
					map("n", "Hr", gs.reset_hunk, { desc = "reset hunk" })
					map("v", "Hs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "stage hunk" })
					map("v", "Hr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "reset hunk" })
					map("n", "HS", gs.stage_buffer, { desc = "stage buffer" })
					map("n", "Hu", gs.undo_stage_hunk, { desc = "undo stage_hunk" })
					map("n", "HR", gs.reset_buffer, { desc = "reset buffer" })
					map("n", "Hp", gs.preview_hunk, { desc = "preview hunk" })
					map("n", "Hb", function()
						gs.blame_line({ full = true })
					end, { desc = "blame line" })
					map("n", "tb", gs.toggle_current_line_blame, { desc = "toggle current_line_blame" })
					map("n", "Hd", gs.diffthis, { desc = "diffthis" })
					map("n", "HD", function()
						gs.diffthis("~")
					end, { desc = "diffthis" })
					map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted" })

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select git hunk" })
				end,
			})
		end,
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		dependencies = {
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- to open commits in browser with fugitive
			"tpope/vim-rhubarb",
		},
		keys = { { "<leader>tj", "<cmd>AdvancedGitSearch<CR>" } },
		cmd = "AdvancedGitSearch",
		config = function()
			require("telescope").load_extension("advanced_git_search")
		end,
	},
}
