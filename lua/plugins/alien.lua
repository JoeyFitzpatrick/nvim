return {
	dir = "~/plugins/alien.nvim",
	name = "alien",
	config = function()
		nmap("<leader>Js", function()
			require("alien").status()
		end, "Alien Status")
	end,
}
