return {
	dir = "~/plugins/alien.nvim",
	name = "alien",
	config = function()
		require("alien").setup()
		nmap("<leader>s", function()
			require("alien").status()
		end, "Alien Status")
		nmap("<leader>S", "<cmd>Lazy reload alien<cr>", "Reload Alien")
	end,
}
