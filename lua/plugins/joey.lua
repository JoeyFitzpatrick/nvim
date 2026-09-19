vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.o.wildmode = "noselect:lastused,full"
vim.api.nvim_create_autocmd("CmdlineChanged", {
	pattern = { ":", "/", "?" },
	callback = function()
		local info = vim.fn.cmdcomplete_info()
		-- vim.print({ info = info })
		vim.fn.wildtrigger()
	end,
})

return {
	{ dir = "~/plugins/the-bag.nvim", name = "the bag" },
	{
		dir = "~/plugins/datadog.nvim",
		name = "datadog",
		config = function()
			vim.keymap.set("n", "<leader><leader>dt", "<cmd>Datadog trace<CR>", { desc = "Datadog trace" })
			vim.keymap.set("n", "<leader><leader>dd", "<cmd>Datadog dashboard<CR>", { desc = "Datadog dashboard" })
		end,
	},
	{
		dir = "~/plugins/periphery.nvim",
		name = "periphery",
		config = function()
			vim.keymap.set("n", "gp", "<cmd>Periphery<CR>", { desc = "Run Periphery" })
		end,
	},
	{
		dir = "~/plugins/swordbill.nvim",
		name = "swordbill",
		init = function()
			vim.g.swordbill_configuration = {
				entrypoint = vim.fn.stdpath("data") .. "/swordbill/queries/restaurant.sql",
				default_connections = {
					{
						filename = "/Users/jfitzpatrick/.local/share/nvim/swordbill/queries/restaurant.sql",
						connection_id = "restaurant",
					},
					{
						filename = "/Users/jfitzpatrick/.local/share/nvim/swordbill/queries/scratch.sql",
						connection_id = "local flask",
					},
					{
						filename = "/Users/jfitzpatrick/.local/share/nvim/swordbill/queries/coreapi.sql",
						connection_id = "local core-api",
					},
				},
			}
		end,
		config = function()
			vim.keymap.set("n", "zz", "<cmd>Swordbill<CR>", { desc = "Open Swordbill" })
			vim.keymap.set("n", "z<space>", ":Swordbill ", { desc = "Swordbill commands" })
		end,
	},
}
