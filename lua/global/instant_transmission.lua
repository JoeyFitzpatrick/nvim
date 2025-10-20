vim.keymap.set("n", "<C-b>", function()
	local original_filename = vim.api.nvim_buf_get_name(0)
	local jumplist = vim.fn.getjumplist()
	local current_pos = jumplist[2]

	-- Jump backward at least once
	if current_pos > 0 then
		pcall(vim.cmd, "silent normal! \15") -- \15 is <C-o>

		while current_pos > 1 and vim.api.nvim_buf_get_name(0) == original_filename do
			local ok = pcall(vim.cmd, "silent normal! \15")
			if not ok then
				break
			end
			current_pos = current_pos - 1
		end
	end
end)

vim.keymap.set("n", "<C-f>", function()
	local original_filename = vim.api.nvim_buf_get_name(0)
	local jumplist = vim.fn.getjumplist()
	local jumps = jumplist[1]
	local current_pos = jumplist[2]
	local max_pos = #jumps - 1

	-- Jump forward at least once
	if current_pos < max_pos then
		pcall(vim.cmd, "normal! 1\t") -- \t is <C-i> (same as <Tab>)

		while current_pos < max_pos - 1 and vim.api.nvim_buf_get_name(0) == original_filename do
			local ok = pcall(vim.cmd, "silent normal! 1\t")
			if not ok then
				break
			end
			current_pos = current_pos + 1
		end
	end
end)

-- Helper function to get indentation level of a line
local function get_indent_level(line)
	local indent = line:match("^%s*")
	return #indent
end

vim.keymap.set("n", "<M-h>", function()
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level(vim.fn.getline(current_line))

	-- Move up until we find a line with less indentation
	for line = current_line - 1, 1, -1 do
		local line_content = vim.fn.getline(line)
		-- Skip empty lines
		if line_content:match("%S") then
			local indent = get_indent_level(line_content)
			if indent < current_indent then
				vim.cmd("normal! m'")
				vim.fn.cursor(line, indent + 1)
				return
			end
		end
	end
end, { desc = "Move up to previous indentation level" })

vim.keymap.set("n", "<M-l>", function()
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level(vim.fn.getline(current_line))
	local last_line = vim.fn.line("$")

	-- Move down until we find a line with greater indentation
	for line = current_line + 1, last_line do
		local line_content = vim.fn.getline(line)
		-- Skip empty lines
		if line_content:match("%S") then
			local indent = get_indent_level(line_content)
			if indent > current_indent then
				vim.cmd("normal! m'")
				vim.fn.cursor(line, indent + 1)
				return
			end
		end
	end
end, { desc = "Move down to next indentation level" })

-- Move up to previous line with same indentation (after encountering a different level)
vim.keymap.set("n", "<M-k>", function()
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level(vim.fn.getline(current_line))
	local found_different = false

	-- Move up until we find a line with same indentation after encountering a different level
	for line = current_line - 1, 1, -1 do
		local line_content = vim.fn.getline(line)
		-- Empty lines count as different indentation
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
end, { desc = "Move up to previous same indentation level" })

-- Move down to next line with same indentation (after encountering a different level)
vim.keymap.set("n", "<M-j>", function()
	local current_line = vim.fn.line(".")
	local current_indent = get_indent_level(vim.fn.getline(current_line))
	local last_line = vim.fn.line("$")
	local found_different = false

	-- Move down until we find a line with same indentation after encountering a different level
	for line = current_line + 1, last_line do
		local line_content = vim.fn.getline(line)
		-- Empty lines count as different indentation
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
end, { desc = "Move down to next same indentation level" })
