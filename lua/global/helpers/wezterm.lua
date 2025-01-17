local wezterm_pane_id = nil

local function wezterm_split()
	if wezterm_pane_id == nil then
		local current_pane_id = os.getenv("WEZTERM_PANE")
		local split_pane_result = vim.system({ "wezterm", "cli", "split-pane", "--right" }, { text = true }):wait()
		if split_pane_result.code ~= 0 then
			return
		end
		wezterm_pane_id = split_pane_result.stdout:gsub("\n", "")
		if current_pane_id == nil then
			return
		end
		print(current_pane_id)
		vim.system({ "wezterm", "cli", "activate-pane", "--pane-id", current_pane_id }, { text = true })
	else
		vim.system({
			"wezterm",
			"cli",
			"send-text",
			"--pane-id",
			wezterm_pane_id,
			"--no-paste",
			"\x03\n\x03\nclear\n", -- \x03 = <ctrl-c>, \n = <enter>
		})
	end
end

local function wezterm_close_split()
	if wezterm_pane_id ~= nil then
		vim.system({ "wezterm", "cli", "kill-pane", "--pane-id", wezterm_pane_id }):wait()
		wezterm_pane_id = nil
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

local lua_commands = {
	test = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return "busted " .. filename
	end,
}

local python_commands = {
	run = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return "python3 " .. filename
	end,
}

local commands = {
	javascript = typescript_commands,
	typescript = typescript_commands,
	javascriptreact = typescript_commands,
	typescriptreact = typescript_commands,
	lua = lua_commands,
	python = python_commands,
}

local function run_in_wezterm_pane(command_type)
	local filetype = vim.bo.filetype
	local full_path = vim.api.nvim_buf_get_name(0)
	local filename = full_path:match("^.+/(.+)$")
	if commands[filetype] == nil or commands[filetype][command_type] == nil then
		print("No command found for " .. filetype .. " file type")
		return
	end

	local cmd = commands[filetype][command_type]
	local full_command = cmd(filename)
	wezterm_split()
	os.execute("wezterm send-keys '" .. full_command .. "' Enter")
	os.execute("wezterm select-pane -L")
end

vim.keymap.set("n", "<leader>ms", wezterm_split)

vim.keymap.set("n", "<leader>mx", wezterm_close_split, { noremap = true, desc = "Close wezterm split" })

vim.keymap.set("n", "<leader>mt", function()
	run_in_wezterm_pane("test")
end, { noremap = true, desc = "Run tests in wezterm pane" })

vim.keymap.set("n", "<leader>mr", function()
	run_in_wezterm_pane("run")
end, { noremap = true, desc = "Run file in wezterm pane" })
