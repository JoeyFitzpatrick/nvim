local lua_commands = {
	test = function(filename)
		return { "busted", filename }
	end,
}

local python_commands = {
	run = function(filename)
		return { "python", filename }
	end,
	test = function(filename, path)
		if string.match(path, "projects/api") then
			return { "echo", filename }
		end
		return { "echo", path }
	end,
}

local zig_commands = {
	run = function(filename)
		return { "zig", "run", filename }
	end,
}

local commands = {
	lua = lua_commands,
	python = python_commands,
	zig = zig_commands,
}

-- Check if any terminal windows are currently visible
local function find_visible_terminal()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buf_type = vim.api.nvim_get_option_value("buftype", { buf = buf })
		if buf_type == "terminal" then
			local chan = vim.api.nvim_buf_get_var(buf, "terminal_job_id")
			return win, chan
		end
	end
	return nil, nil
end

local function open_terminal_split()
	vim.cmd("rightbelow vsplit | terminal")
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local chan = vim.api.nvim_buf_get_var(buf, "terminal_job_id")
	return win, chan
end

local function run_command(cmd_args)
	local term_win, term_chan = find_visible_terminal()

	if not term_win then
		_, term_chan = open_terminal_split()
	end

	local cmd_string = table.concat(cmd_args, " ") .. "\n"
	vim.fn.chansend(term_chan, cmd_string)
end

local function run_in_term_split(command_type)
	local filetype = vim.bo.filetype
	local full_path = vim.api.nvim_buf_get_name(0)
	local relative_filepath = vim.fn.expand("%:.")
	if commands[filetype] == nil or commands[filetype][command_type] == nil then
		print("No command found for " .. filetype .. " file type")
		return
	end

	local cmd = commands[filetype][command_type](relative_filepath, full_path)
	run_command(cmd)
end

vim.keymap.set("n", "<leader>mt", function()
	run_in_term_split("test")
end, { noremap = true, desc = "Run tests in term split" })

vim.keymap.set("n", "<leader>mr", function()
	run_in_term_split("run")
end, { noremap = true, desc = "Run file in wezterm pane" })
