return {
	{
		"folke/sidekick.nvim",
		lazy = false,
		opts = {
			copilot = {
				status = {
					enabled = true,
					level = vim.log.levels.WARN,
				},
			},
		},
		keys = {
			{
				"<tab>",
				function()
					-- if there is a next edit, jump to it, otherwise apply it if any
					if not require("plugins.ai").nes_jump_or_apply() then
						return "<Tab>" -- fallback to normal tab
					end
				end,
				expr = true,
				desc = "Goto/Apply Next Edit Suggestion",
			},
			{
				"<c-.>",
				function()
					require("sidekick.cli").toggle({ name = "claude", focus = true })
				end,
				desc = "Sidekick Toggle",
				mode = { "n", "t", "i", "x" },
			},
			{
				"<leader>an",
				function()
					require("sidekick.nes").toggle()
				end,
				desc = "Select NES",
			},
			{
				"<leader>as",
				function()
					require("sidekick.cli").select()
				end,
				-- Or to select only installed tools:
				-- require("sidekick.cli").select({ filter = { installed = true } })
				desc = "Select CLI",
			},
			{
				"<leader>ad",
				function()
					require("sidekick.cli").close()
				end,
				desc = "Detach a CLI Session",
			},
			{
				"<leader>at",
				function()
					require("sidekick.cli").send({ msg = "{this}", name = "claude", focus = true })
				end,
				mode = { "x", "n" },
				desc = "Send This",
			},
			{
				"<leader>af",
				function()
					require("sidekick.cli").send({ msg = "{file}", name = "claude", focus = true })
				end,
				desc = "Send File",
			},
			{
				"<leader>av",
				function()
					require("sidekick.cli").send({ msg = "{selection}", name = "claude", focus = true })
				end,
				mode = { "x" },
				desc = "Send Visual Selection",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt({ name = "claude", focus = true })
				end,
				mode = { "n", "x" },
				desc = "Sidekick Select Prompt",
			},
			-- Example of a keybinding to open Claude directly
			{
				"<leader>ac",
				function()
					require("sidekick.cli").toggle({ name = "claude", focus = true })
				end,
				desc = "Sidekick Toggle Claude",
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = false,
				},
			})
			local suggestion = require("copilot.suggestion")
			vim.keymap.set("i", "<M-n>", suggestion.next)
			vim.keymap.set("i", "<M-p>", suggestion.prev)
			vim.keymap.set("i", "<M-y>", suggestion.accept)
		end,
	},
}
