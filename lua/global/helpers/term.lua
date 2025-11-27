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

local function get_terminal()
	local term_win, term_chan = find_visible_terminal()
	if not term_win then
		term_win, term_chan = open_terminal_split()
	end
	return term_win, term_chan
end

local function run_command(cmd_args)
	local _, term_chan = get_terminal()
	vim.fn.chansend(term_chan, cmd_args)
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

local function get_visual_selection(mode)
	local text = ""
	local maxcol = vim.v.maxcol
	local region = vim.region(0, "'<", "'>", mode or vim.fn.visualmode(), true)
	for line, cols in vim.spairs(region) do
		local endcol = cols[2] == maxcol and -1 or cols[2]
		local chunk = vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
		text = ("%s\n%s"):format(text, chunk)
	end
	return text
end

vim.keymap.set("n", "<leader>tt", function()
	run_in_term_split("test")
end, { noremap = true, desc = "Run tests in term split" })

vim.keymap.set("n", "<leader>tr", function()
	run_in_term_split("run")
end, { noremap = true, desc = "Run file in term split" })

vim.keymap.set("n", "<leader>ts", function()
	local line = vim.api.nvim_get_current_line()
	run_command(line .. "\n")
end, { desc = "Send line to terminal" })

vim.keymap.set("x", "<leader>tt", function()
	local mode = vim.fn.mode()
	-- Exit visual mode to update the marks
	vim.cmd("normal! \27") -- ESC key
	local text = get_visual_selection(mode)

	vim.fn.setreg("b", text)
	local win, _ = get_terminal()
	vim.api.nvim_set_current_win(win)
	-- Use feedkeys to paste from clipboard register in terminal mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-N>"bpi', true, false, true), "n", false)
end, { desc = "Send selected lines to terminal" })

vim.keymap.set("x", "<leader>tr", function()
	local mode = vim.fn.mode()
	-- Exit visual mode to update the marks
	vim.cmd("normal! \27") -- ESC key
	local text = get_visual_selection(mode)

	vim.fn.setreg("b", text)
	local win, _ = get_terminal()
	vim.api.nvim_set_current_win(win)
	-- Use feedkeys to paste from clipboard register in terminal mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-N>"bpi<CR>', true, false, true), "n", false)
end, { desc = "Run selected lines in terminal" })

vim.keymap.set("t", "<A-esc>", "<C-\\><C-n>") -- leave insert mode in terminal
vim.keymap.set("n", "<leader>th", "<cmd>vsplit | term<CR>", { noremap = true, desc = "Open term left" })
vim.keymap.set("n", "<leader>tj", "<cmd>rightbelow split | term<CR>", { noremap = true, desc = "Open term below" })
vim.keymap.set("n", "<leader>tk", "<cmd>split | term<CR>", { noremap = true, desc = "Open term above" })
vim.keymap.set("n", "<leader>tl", "<cmd>rightbelow vsplit | term<CR>", { noremap = true, desc = "Open term right" })

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	desc = "Config for terminal buffers",
	group = vim.api.nvim_create_augroup("TermBufferConfig", { clear = true }),
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
		vim.keymap.set("n", "<C-d>", function()
			vim.api.nvim_buf_delete(0, { force = true })
		end, { buffer = 0, desc = "Close term with <C-d> in normal mode" })
	end,
})
