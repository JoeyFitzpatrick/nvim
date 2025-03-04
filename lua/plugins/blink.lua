return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	version = "v0.12",
	build = "cargo build --release",
	opts = {
		appearance = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = false,
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
			sources = function()
				local type = vim.fn.getcmdtype()
				-- Search forward and backward
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				-- Commands
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
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
}
