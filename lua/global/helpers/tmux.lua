local typescript_commands = {
	test = "pnpm vitest",
}

local function run_in_tmux_pane(command)
	local filetype = vim.bo.filetype
	local full_path = vim.api.nvim_buf_get_name(0)
	local filename = full_path:match("^.+/(.+)$")
	local commands = {
		javascript = typescript_commands,
		typescript = typescript_commands,
		javascriptreact = typescript_commands,
		typescriptreact = typescript_commands,
	}

	if commands[filetype] ~= nil and commands[filetype][command] ~= nil then
		local full_command = commands[filetype][command] .. " " .. filename
		os.execute("tmux split-window -h")
		os.execute("tmux send-keys '" .. full_command .. "' Enter")
		os.execute("tmux select-pane -L")
	else
		print("No command found for " .. filetype .. " file type and command " .. command)
	end
end

vim.keymap.set("n", "<leader>xt", function()
	run_in_tmux_pane("test")
end, { noremap = true, desc = "Run tests in tmux pane" })
