return {
	{
		"saghen/blink.cmp",
		build = "cargo build --release",
		event = "BufEnter",
		opts = {
			appearance = {
				-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
			},
			completion = {
				list = { selection = { auto_insert = true } },
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = true,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets" },
			},
			cmdline = {
				completion = { menu = { auto_show = true } },
			},

			keymap = {
				preset = "default",
				["<C-y>"] = { "select_and_accept" },
				["<C-n>"] = { "select_next", "show" },
				["<Up>"] = {},
				["<Down>"] = {},
				["<C-k>"] = {},
			},
		},
	},
}
