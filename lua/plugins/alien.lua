return {
	dir = "~/plugins/alien.nvim",
	name = "alien",
	config = function()
		require("alien").setup({ test = "from config" })
		local alien = require("alien")
		nmap("<leader>s", alien.status, "Alien Status")
		nmap("<leader>b", alien.local_branches, "Alien Branches")
		nmap("<leader>S", "<cmd>Lazy reload alien<cr>", "Reload Alien")
		nmap("gb", alien.blame, "Alien Blame")
		nmap("gs", alien.stashes, "Alien Stash")
	end,
}
