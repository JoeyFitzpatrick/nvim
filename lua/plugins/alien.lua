return {
	dir = "~/plugins/alien.nvim",
	name = "alien",
	config = function()
		require("alien").setup()
		nmap("<leader>s", function()
			require("alien").status()
		end, "Alien Status")
		nmap("<leader>tm", function()
			require("alien").toggle_time_machine()
		end)
		nmap("<leader>S", "<cmd>Lazy reload alien<cr>", "Reload Alien")
	end,
}
