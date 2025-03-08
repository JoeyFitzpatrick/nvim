return {
	"folke/snacks.nvim",
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		bigfile = {},
		explorer = {},
		indent = {
			animate = {
				enabled = false,
			},
		},
		input = {},
		lazygit = {},
		picker = {
			matcher = {
				frecency = true,
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "i" } },
					},
				},
			},
			layouts = {
				default = {
					layout = {
						box = "horizontal",
						width = 0.9,
						min_width = 120,
						height = 0.9,
						{
							box = "vertical",
							border = "rounded",
							title = "{source} {live}",
							title_pos = "center",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", border = "rounded", width = 0.5 },
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>jk",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>jl",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>f",
			function()
				Snacks.picker.smart()
			end,
			desc = "Find Files",
		},
		{
			"<leader>ep",
			function()
				Snacks.picker.files({ cwd = "~/.local/share/nvim/lazy" })
			end,
			desc = "Edit Plugins",
		},
		{
			"<leader>er",
			function()
				Snacks.picker.files({ cwd = "~/.config/scripts" })
			end,
			desc = "Edit Rest Request Files",
		},
		{
			"<leader>se",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "x" },
		},
		-- search
		{
			'<leader>s"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Commands",
		},
		{
			"gh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader><leader>g",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo Tree",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ds",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "[D]ocument [S]ymbols",
		},
		{
			"<leader>lw",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
	},
}
