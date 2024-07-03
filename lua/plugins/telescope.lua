return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				event = "VeryLazy",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", function()
				require("telescope").extensions.smart_open.smart_open({
					cwd_only = true,
					filename_first = true,
				})
			end, {})
			vim.keymap.set("v", "<leader>f", function()
				builtin.find_files({ default_text = require("global.utils").get_visual_selection() })
			end, {})
			vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>dg", builtin.diagnostics, {})
			-- vim.keymap.set("n", "<leader>M", builtin.marks, {})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")

			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- In this case, we create a function that lets us more easily define mappings specific
			-- for LSP related items. It sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			-- nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
			vim.keymap.set("n", "<leader>tr", "<cmd>lua require('telescope.builtin').resume()<cr>")

			local actions = require("telescope.actions")

			vim.keymap.set(
				"n",
				"<leader>ks",
				require("global.telescope-custom").git_commands,
				{ desc = "Git commands" }
			)

			require("telescope").setup({
				defaults = {
					layout_config = {
						horizontal = { width = 0.95, preview_width = 0.6, preview_cutoff = 0 },
					},
					layout_strategy = "horizontal",
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<esc>"] = actions.close,
						},
					},
				},
			})
		end,
	},
	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("smart_open")
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	},
}
