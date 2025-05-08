local function write_wezterm_colorscheme(colorscheme)
	local filename = vim.fn.expand(os.getenv("HOME") .. "/.config/wezterm/colorscheme")
	assert(type(filename) == "string")
	local file = io.open(filename, "w")
	assert(file)
	file:write(colorscheme)
	file:close()
	vim.notify("Setting WezTerm color scheme to " .. colorscheme, vim.log.levels.INFO)
end

--- Pass in two tables, one for dark colorschemes and one for light.
--- Each table should have:
--- `nvim_name`: name of the colorscheme that nvim uses
--- `wezterm_name`: name of the colorscheme that wezterm uses
---@param dark { nvim_name: string, wezterm_name: string }
---@param light { nvim_name: string, wezterm_name: string }
local function setup_colorschemes(dark, light)
	vim.cmd("colorscheme " .. dark.nvim_name)
	function set_light()
		vim.cmd("set background=light | colorscheme " .. light.nvim_name)
		write_wezterm_colorscheme(light.wezterm_name)
	end
	function set_dark()
		vim.cmd("set background=dark | colorscheme " .. dark.nvim_name)
		write_wezterm_colorscheme(dark.wezterm_name)
	end
	vim.cmd("command Light silent lua set_light()")
	vim.cmd("command Dark silent lua set_dark()")
end

-- Colorscheme plugin used
return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("kanagawa").setup({
			-- make gutter same color as everything else
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
			-- make completion menu match colorscheme
			overrides = function(colors)
				local theme = colors.theme
				return {
					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },
				}
			end,
		})
		setup_colorschemes(
			{ nvim_name = "kanagawa-wave", wezterm_name = "Kanagawa (Gogh)" },
			{ nvim_name = "kanagawa-lotus", wezterm_name = "Kanagawa Lotus" }
		)
	end,
}
