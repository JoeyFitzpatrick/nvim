return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		nmap("<leader>F", fzf.files)
		-- nmap("<leader>G", fzf.live_grep_glob)
	end,
}
