return {
	dir = "~/plugins/alien.nvim",
	name = "alien",
	config = function()
		require("alien").setup({ test = "from config" })
		local alien = require("alien")
		nmap("<leader>s", alien.status, "Alien Status")
		nmap("<leader>S", "<cmd>Lazy reload alien<cr>", "Reload Alien")
	end,
}
