local M = {}

-- TODO: make brackets work
local raw_special_chars = vim.fn.escape("%[%]{}()<>\"'`", "{}()<>\"'`")
local special_chars = "[" .. raw_special_chars .. "]"
local special_chars_reverse = special_chars .. "[^" .. raw_special_chars .. "]*$"

M.find_next_special_char = function()
	local line = vim.api.nvim_get_current_line()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local line_num = cursor_pos[1]
	local cursor_col = cursor_pos[2]
	local match = line:find(special_chars, cursor_col + 2)
	if match then
		vim.api.nvim_win_set_cursor(0, { line_num, match - 1 })
		return
	end
	while line_num < vim.api.nvim_buf_line_count(0) do
		line_num = line_num + 1
		line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]
		match = line:find(special_chars)
		if match then
			vim.api.nvim_win_set_cursor(0, { line_num, match - 1 })
			return
		end
	end
end

M.find_previous_special_char = function()
	local line = vim.api.nvim_get_current_line()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local line_num = cursor_pos[1]
	local cursor_col = cursor_pos[2]

	local line_until_cursor = line:sub(0, cursor_col)
	local match = line_until_cursor:find(special_chars_reverse)
	if match then
		vim.api.nvim_win_set_cursor(0, { line_num, match - 1 })
		return
	end

	while line_num > 1 do
		line_num = line_num - 1
		line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]

		match = line:find(special_chars_reverse)
		if match then
			vim.api.nvim_win_set_cursor(0, { line_num, match - 1 })
			return
		end
	end
end

return M
