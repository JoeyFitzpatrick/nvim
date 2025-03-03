local function write_wezterm_colorscheme(colorscheme)
	local filename = vim.fn.expand(os.getenv("HOME") .. "/wezterm/colorscheme")
	assert(type(filename) == "string")
	local file = io.open(filename, "w")
	assert(file)
	file:write(colorscheme)
	file:close()
	vim.notify("Setting WezTerm color scheme to " .. colorscheme, vim.log.levels.INFO)
end

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd("colorscheme tokyonight-storm")
		function light()
			vim.cmd("set background=light | colorscheme tokyonight-day")
			vim.cmd([[
                          highlight Cursor guifg=green guibg=#DDDDDD
                          highlight iCursor guifg=green guibg=#0000ff
                        ]])
			write_wezterm_colorscheme("Tokyo Night Day")
		end
		function dark()
			vim.cmd("set background=dark | colorscheme tokyonight-storm")
			write_wezterm_colorscheme("Tokyo Night Storm")
		end
		vim.cmd("command Light silent lua light()")
		vim.cmd("command Dark silent lua dark()")
	end,
}
