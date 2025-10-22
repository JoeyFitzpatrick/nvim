return {
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
				winopts = {
					height = 0.90,
					width = 0.90,
					row = 0.5,
					col = 0.5,
					preview = {
						layout = "horizontal",
						horizontal = "right:50%",
						scrollbar = "border",
					},
				},
				keymap = {
					fzf = {
						true,
						["ctrl-q"] = "select-all+accept", -- Sends all results to quickfix
					},
				},
			})

			local fzf = require("fzf-lua")
			fzf.register_ui_select()

			-- General mappings
			vim.keymap.set("n", "<leader>,", fzf.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>g", fzf.live_grep, { desc = "Grep" })
			vim.keymap.set("n", "<leader>G", fzf.global, { desc = "Global picker" })
			vim.keymap.set("n", "<leader>:", fzf.command_history, { desc = "Command History" })
			-- handling this with the fzf-lua-frecency plugin
			-- vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>ep", function()
				fzf.files({ cwd = "~/.local/share/nvim/lazy" })
			end, { desc = "Edit Plugins" })
			vim.keymap.set("n", "<leader>er", function()
				fzf.files({ cwd = "~/.config/scripts" })
			end, { desc = "Edit Rest Request Files" })
			vim.keymap.set("n", "<leader>sb", fzf.blines, { desc = "Buffer Lines" })
			vim.keymap.set("x", "<leader>g", fzf.grep_visual, { desc = "Visual selection or word" })

			-- Search mappings
			vim.keymap.set("n", '<leader>s"', fzf.registers, { desc = "Registers" })
			vim.keymap.set("n", "<leader>sc", fzf.commands, { desc = "Commands" })
			vim.keymap.set("n", "<leader>sl", fzf.git_commits, { desc = "Git Log" })
			vim.keymap.set("n", "gh", fzf.help_tags, { desc = "Help Pages" })
			vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>sm", fzf.man_pages, { desc = "Man Pages" })
			vim.keymap.set("n", "<leader>sp", fzf.builtin, { desc = "Search Pickers" })
			vim.keymap.set("n", "<leader><leader>g", fzf.resume, { desc = "Resume" })
			vim.keymap.set("n", "<leader>sC", fzf.colorschemes, { desc = "Colorschemes" })
			vim.keymap.set("n", "<leader>sh", fzf.search_history, { desc = "Search History" })
			vim.keymap.set("n", "<leader>sH", fzf.highlights, { desc = "Highlights" })

			-- LSP mappings
			vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "Goto Definition" })
			vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "References", nowait = true })
			vim.keymap.set("n", "gt", fzf.lsp_typedefs, { desc = "Goto Type Definition", nowait = true })
			vim.keymap.set("n", "gw", fzf.lsp_workspace_symbols, { desc = "Workspace Symbols", nowait = true })
			vim.keymap.set("n", "gI", fzf.lsp_implementations, { desc = "Goto Implementation" })
			vim.keymap.set("n", "<leader>ds", fzf.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
			vim.keymap.set("n", "<leader>ld", fzf.diagnostics_document, { desc = "Document diagnostics" })
			vim.keymap.set("n", "<leader>lw", fzf.diagnostics_workspace, { desc = "Workspace diagnostics" })

			-- Additional mappings
			vim.keymap.set("n", "<leader>so", fzf.oldfiles, { desc = "Recent Files" })
			vim.keymap.set("n", "<leader>sj", fzf.jumps, { desc = "Jumplist" })
			vim.keymap.set("n", "<leader>/", fzf.grep_curbuf, { desc = "Search in current buffer" })
		end,
	},
	{
		"elanmed/fzf-lua-frecency.nvim",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>f", function()
				require("fzf-lua-frecency").frecency({
					cwd_only = true,
					display_score = false,
				})
			end)
		end,
	},
}
