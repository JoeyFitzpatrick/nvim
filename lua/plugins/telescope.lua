return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			event = "VeryLazy",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		-- vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
		-- vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
		vim.keymap.set("v", "<leader>g", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>H", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>dg", builtin.diagnostics, {})
		vim.keymap.set("n", "<leader>M", builtin.marks, {})

		vim.keymap.set("n", "<leader>g", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

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

		nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols") -- This conflicts with current diagnostics remap
		nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		vim.keymap.set("n", "<leader>tr", "<cmd>lua require('telescope.builtin').resume()<cr>")

		function vim.getVisualSelection()
			vim.cmd('noau normal! "vy"')
			local text = vim.fn.getreg("v")
			vim.fn.setreg("v", {})

			text = string.gsub(text, "\n", "")
			if #text > 0 then
				return text
			else
				return ""
			end
		end

		local opts = { noremap = true, silent = true }

		vim.keymap.set("v", "<space>g", function()
			local text = vim.getVisualSelection()
			builtin.live_grep({ default_text = text })
		end, opts)

		require("telescope").load_extension("live_grep_args")
		local lga_actions = require("telescope-live-grep-args.actions")
		local actions = require("telescope.actions")

		local telescope_harpoon = {}
		local utils = require("telescope.actions.utils")
		telescope_harpoon.mark_file = function(tb)
			actions.drop_all(tb)
			actions.add_selection(tb)
			utils.map_selections(tb, function(selection)
				local s = selection[1]
				if s:find(":") then
					s = s:match("^(.-):")
				end
				pcall(require("harpoon.mark").add_file, s)
			end)
			actions.move_selection_worse(tb)
			actions.remove_selection(tb)
		end
		require("telescope").setup({
			defaults = {
				layout_config = {
					vertical = { width = 0.9, preview_cutoff = 0 },
				},
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
						["<C-a>"] = telescope_harpoon.mark_file,
						["<C-t>"] = lga_actions.quote_prompt({ postfix = " --type " }),
						["<C-l>"] = lga_actions.quote_prompt({ postfix = " --glob *" }),
						["<C-f>"] = lga_actions.quote_prompt({ postfix = " " }),
					},
				},
			},
		})
	end,
}
