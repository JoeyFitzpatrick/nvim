local tmux_pane_id = nil

local function tmux_split()
	if tmux_pane_id == nil then
		os.execute("tmux split-window -h")
		tmux_pane_id = vim.fn.system("tmux display-message -p '#D'"):gsub("\n", "")
	else
		os.execute("tmux select-pane -t " .. tmux_pane_id)
		os.execute("tmux send-keys 'C-c' Enter 'C-c' Enter 'clear' Enter")
	end
end

local function tmux_close_split()
	if tmux_pane_id ~= nil then
		os.execute("tmux kill-pane -t " .. tmux_pane_id)
		tmux_pane_id = nil
	end
end

local typescript_commands = {
	test = function(filename)
		local path = vim.api.nvim_buf_get_name(0)
		if string.match(path, "e2e") then
			return "pnpm test:e2e --ui " .. filename
		else
			return "pnpm vitest " .. filename
		end
	end,
}

local function run_in_tmux_pane(command_type)
	local filetype = vim.bo.filetype
	local full_path = vim.api.nvim_buf_get_name(0)
	local filename = full_path:match("^.+/(.+)$")
	local commands = {
		javascript = typescript_commands,
		typescript = typescript_commands,
		javascriptreact = typescript_commands,
		typescriptreact = typescript_commands,
	}
	if commands[filetype] == nil or commands[filetype][command_type] == nil then
		print("No command found for " .. filetype .. " file type")
		return
	end

	local cmd = commands[filetype][command_type]
	local full_command = cmd(filename)
	tmux_split()
	os.execute("tmux send-keys '" .. full_command .. "' Enter")
	os.execute("tmux select-pane -L")
end

local function run_raw_command_in_tmux_pane(command)
	tmux_split()
	os.execute("tmux send-keys '" .. command .. "' Enter")
end

vim.keymap.set("n", "<leader>mx", function()
	tmux_close_split()
end, { noremap = true, desc = "Close tmux split" })

vim.keymap.set("n", "<leader>mt", function()
	run_in_tmux_pane("test")
end, { noremap = true, desc = "Run tests in tmux pane" })

vim.keymap.set("n", "<leader>mc", function()
	vim.ui.input({ prompt = "enter commit message: " }, function(input)
		if input == nil or input == "" then
			vim.notify("No commit message provided, aborting...")
			return
		end
		-- Escape spaces in the command to work with tmux
		input = '"' .. input .. '"'
		run_raw_command_in_tmux_pane("git commit -m " .. input)
	end)
end, { noremap = true, desc = "Commit in tmux pane" })
