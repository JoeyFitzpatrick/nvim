return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	config = function()
		nmap("<leader>ha", require("grapple").toggle)
		nmap("<leader>hs", require("grapple").toggle_tags)
		nmap("<leader>hc", require("grapple").toggle_scopes)
		nmap("<C-n>", require("grapple").cycle_forward)
		nmap("<C-p>", require("grapple").cycle_backward)
		for i = 1, 9, 1 do
			nmap("<leader>h" .. i, function()
				require("grapple").select({ index = i })
			end)
		end
		-- TODO: make a way to switch to a scope via a keybinding
		-- require("grapple").use_scope("git_branch")
	end,
}
