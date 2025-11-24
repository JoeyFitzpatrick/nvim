local M = {}

local highlight = function(name, foreground, background)
	local command = { "highlight", name }
	if foreground and foreground ~= "none" then
		table.insert(command, "guifg=" .. foreground)
	end
	if background and background ~= "none" then
		table.insert(command, "guibg=" .. background)
	end
	vim.cmd(table.concat(command, " "))
end

local create_component_highlight_group = function(color, highlight_tag)
	if color.bg and color.fg then
		local highlight_group_name = table.concat({ "luatab", highlight_tag }, "_")
		highlight(highlight_group_name, color.fg, color.bg)
		return highlight_group_name
	end
end

local extract_highlight_colors = function(color_group, scope)
	if vim.fn.hlexists(color_group) == 0 then
		return nil
	end
	local color = vim.api.nvim_get_hl_by_name(color_group, true)
	if color.background ~= nil then
		color.bg = string.format("#%06x", color.background)
		color.background = nil
	end
	if color.foreground ~= nil then
		color.fg = string.format("#%06x", color.foreground)
		color.foreground = nil
	end
	if scope then
		return color[scope]
	end
	return color
end

M.title = function(bufnr)
	local file = vim.fn.bufname(bufnr)
	local buftype = vim.fn.getbufvar(bufnr, "&buftype")
	local filetype = vim.fn.getbufvar(bufnr, "&filetype")

	if buftype == "help" then
		return "help:" .. vim.fn.fnamemodify(file, ":t:r")
	elseif buftype == "quickfix" then
		return "quickfix"
	elseif filetype == "TelescopePrompt" then
		return "Telescope"
	elseif filetype == "git" then
		return "Git"
	elseif filetype == "fugitive" then
		return "Fugitive"
	elseif filetype == "NvimTree" then
		return "NvimTree"
	elseif filetype == "neo-tree" then
		return "NeoTree"
	elseif filetype == "oil" then
		return "Oil"
	elseif file:sub(file:len() - 2, file:len()) == "FZF" then
		return "FZF"
	elseif buftype == "terminal" then
		local _, mtch = string.match(file, "term:(.*):(%a+)")
		return mtch ~= nil and mtch or vim.fn.fnamemodify(vim.env.SHELL, ":t")
	elseif file == "" then
		return "[No Name]"
	else
		return vim.fn.pathshorten(vim.fn.fnamemodify(file, ":p:~:t"))
	end
end

M.modified = function(bufnr)
	return vim.fn.getbufvar(bufnr, "&modified") == 1 and "[+] " or ""
end

M.windowCount = function(index)
	local nwins = vim.fn.tabpagewinnr(index, "$")
	return nwins > 1 and "(" .. nwins .. ") " or ""
end

M.devicon = function(bufnr, isSelected)
	local icon, devhl
	local file = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":t")
	local buftype = vim.fn.getbufvar(bufnr, "&buftype")
	local filetype = vim.fn.getbufvar(bufnr, "&filetype")
	local devicons = require("nvim-web-devicons")
	if filetype == "TelescopePrompt" then
		icon, devhl = devicons.get_icon("telescope")
	elseif filetype == "fugitive" then
		icon, devhl = devicons.get_icon("git")
	elseif filetype == "vimwiki" then
		icon, devhl = devicons.get_icon("markdown")
	elseif buftype == "terminal" then
		icon, devhl = devicons.get_icon("zsh")
	else
		icon, devhl = devicons.get_icon(file, vim.fn.expand("#" .. bufnr .. ":e"))
	end
	if icon then
		local fg = extract_highlight_colors(devhl, "fg")
		local bg = extract_highlight_colors("TabLineSel", "bg")
		local hl = create_component_highlight_group({ bg = bg, fg = fg }, devhl)
		local selectedHlStart = (isSelected and hl) and "%#" .. hl .. "#" or ""
		local selectedHlEnd = isSelected and "%#TabLineSel#" or ""
		return selectedHlStart .. icon .. selectedHlEnd .. " "
	end
	return ""
end

M.separator = function(index)
	return (index < vim.fn.tabpagenr("$") and "%#TabLine#|" or "")
end

M.cell = function(index)
	local isSelected = vim.fn.tabpagenr() == index
	local buflist = vim.fn.tabpagebuflist(index)
	local winnr = vim.fn.tabpagewinnr(index)
	local bufnr = buflist[winnr]
	local hl = (isSelected and "%#TabLineSel#" or "%#TabLine#")

	return hl
		.. "%"
		.. index
		.. "T"
		.. " "
		.. M.windowCount(index)
		.. M.title(bufnr)
		.. " "
		.. M.modified(bufnr)
		.. M.devicon(bufnr, isSelected)
		.. "%T"
		.. M.separator(index)
end

M.tabline = function()
	local line = ""
	for i = 1, vim.fn.tabpagenr("$"), 1 do
		line = line .. M.cell(i)
	end
	line = line .. "%#TabLineFill#%="
	if vim.fn.tabpagenr("$") > 1 then
		line = line .. "%#TabLine#%999XX"
	end
	return line
end

local setup = function()
	vim.opt.tabline = "%!v:lua.require'global.tabs'.helpers.tabline()"
end

return {
	helpers = M,
	setup = setup,
}
