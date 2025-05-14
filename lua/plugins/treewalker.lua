return {
	"aaronik/treewalker.nvim",
	config = function()
		-- movement
		vim.keymap.set({ "n", "v" }, "<c-k>", "<cmd>Treewalker Up<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<c-j>", "<cmd>Treewalker Down<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<c-h>", "<cmd>Treewalker Left<cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "<c-l>", "<cmd>Treewalker Right<cr>", { silent = true })

		-- swapping
		vim.keymap.set("n", "<c-S-j>", "<cmd>Treewalker SwapDown<cr>", { silent = true })
		vim.keymap.set("n", "<c-S-k>", "<cmd>Treewalker SwapUp<cr>", { silent = true })
		vim.keymap.set("n", "<c-S-h>", "<cmd>Treewalker SwapLeft<cr>", { silent = true })
		vim.keymap.set("n", "<c-S-l>", "<cmd>Treewalker SwapRight<cr>", { silent = true })
	end,
}
