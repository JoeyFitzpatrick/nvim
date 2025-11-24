--- Get the indent level of a given line.
--- With no args, returns the indent level of the current line.
---@param line string | nil
---@return integer
local function get_indent_level(line)
	line = line or vim.api.nvim_get_current_line()
	local indent = line:match("^%s*")
	return #indent
end

--- Move to a line with different indentation (greater or lesser)
---@param direction "up" | "down" -- Direction to search
---@param compare function -- Function to compare indents: (found_indent, current_indent) -> boolean
local function move_to_indent_level(direction, compare)
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level()
	local start_line, end_line, step

	if direction == "up" then
		start_line, end_line, step = current_line - 1, 1, -1
	else
		start_line, end_line, step = current_line + 1, vim.fn.line("$"), 1
	end

	for line = start_line, end_line, step do
		local line_content = vim.fn.getline(line)
		-- Skip empty lines
		if line_content:match("%S") then
			local indent = get_indent_level(line_content)
			if compare(indent, current_indent) then
				vim.cmd("normal! m'")
				vim.fn.cursor(line, indent + 1)
				return
			end
		end
	end
end

vim.keymap.set("n", "<M-h>", function()
	move_to_indent_level("up", function(indent, current)
		return indent < current
	end)
end, { desc = "Move up to previous indentation level" })

vim.keymap.set("n", "<M-l>", function()
	move_to_indent_level("down", function(indent, current)
		return indent > current
	end)
end, { desc = "Move down to next indentation level" })

local function move_to_same_indent_level(direction)
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level()
	local found_different = false
	local start_line, end_line, step

	if direction == "up" then
		start_line, end_line, step = current_line - 1, 1, -1
	else
		start_line, end_line, step = current_line + 1, vim.fn.line("$"), 1
	end

	for line = start_line, end_line, step do
		local line_content = vim.fn.getline(line)
		if not line_content:match("%S") then
			found_different = true
		else
			local indent = get_indent_level(line_content)
			if indent ~= current_indent then
				found_different = true
			elseif found_different and indent == current_indent then
				vim.cmd("normal! m'")
				vim.fn.cursor(line, indent + 1)
				return
			end
		end
	end
end

vim.keymap.set("n", "<M-k>", function()
	move_to_same_indent_level("up")
end, { desc = "Move up to previous same indentation level" })

vim.keymap.set("n", "<M-j>", function()
	move_to_same_indent_level("down")
end, { desc = "Move down to next same indentation level" })

local function get_indent_range(mode)
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level()
	local start_line = current_line
	local end_line = current_line

	if mode == "inner" then
		for line = current_line - 1, 1, -1 do
			local line_content = vim.fn.getline(line)
			if line_content:match("%S") then
				local indent = get_indent_level(line_content)
				if indent < current_indent then
					break
				end
				start_line = line
			end
		end

		for line = current_line + 1, vim.fn.line("$") do
			local line_content = vim.fn.getline(line)
			if line_content:match("%S") then
				local indent = get_indent_level(line_content)
				if indent < current_indent then
					break
				end
				end_line = line
			end
		end
	elseif mode == "around" then
		local top_indent = nil

		for line = current_line - 1, 1, -1 do
			local line_content = vim.fn.getline(line)
			if line_content:match("%S") then
				local indent = get_indent_level(line_content)
				if indent < current_indent then
					start_line = line
					top_indent = indent
					break
				end
				start_line = line
			end
		end

		for line = current_line + 1, vim.fn.line("$") do
			local line_content = vim.fn.getline(line)
			if line_content:match("%S") then
				local indent = get_indent_level(line_content)
				if indent < current_indent then
					if top_indent and indent >= top_indent then
						end_line = line
					end
					break
				end
				end_line = line
			end
		end
	end

	return start_line, end_line
end

local function select_indent_block(mode)
	local start_line, end_line = get_indent_range(mode)
	vim.cmd("normal! V")
	vim.fn.cursor(start_line, 1)
	vim.cmd("normal! o")
	vim.fn.cursor(end_line, 1)
end

vim.keymap.set("x", "ii", function()
	select_indent_block("inner")
end, { desc = "Select inner indent block" })

vim.keymap.set("x", "ai", function()
	select_indent_block("around")
end, { desc = "Select around indent block" })

vim.keymap.set("o", "ii", function()
	local start_line, end_line = get_indent_range("inner")
	vim.fn.execute("normal! " .. start_line .. "GV" .. end_line .. "G")
end, { desc = "Select inner indent block" })

vim.keymap.set("o", "ai", function()
	local start_line, end_line = get_indent_range("around")
	vim.fn.execute("normal! " .. start_line .. "GV" .. end_line .. "G")
end, { desc = "Select around indent block" })
