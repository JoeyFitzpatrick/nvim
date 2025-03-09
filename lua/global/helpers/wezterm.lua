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
		vim.system({ "wezterm", "cli", "activate-pane", "--pane-id", current_pane_id }, { text = true }):wait()
	else
		vim.system({
			"wezterm",
			"cli",
			"send-text",
			"--pane-id",
			wezterm_pane_id,
			"--no-paste",
			"\x03\n\x03\nhello\n", -- \x03 = <ctrl-c>, \n = <enter>
		}):wait()
	end
end

local function wezterm_close_split()
	if wezterm_pane_id ~= nil then
		vim.system({ "wezterm", "cli", "kill-pane", "--pane-id", wezterm_pane_id }):wait()
		wezterm_pane_id = nil
	end
end

---@param command string[]
local function wezterm_send_command(command)
	if not wezterm_pane_id then
		return
	end
	local wezterm_command = {
		"wezterm",
		"cli",
		"send-text",
		"--pane-id",
		wezterm_pane_id,
		"--no-paste",
		table.concat(command, " ") .. "\n",
	}
	vim.system(wezterm_command, { text = true }):wait()
end

local typescript_commands = {
	test = function(filename, path)
		if string.match(path, "e2e") then
			return { "pnpm", "test:e2e", "--ui", filename }
		else
			return { "pnpm", "vitest", filename }
		end
	end,
}

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
	javascript = typescript_commands,
	typescript = typescript_commands,
	javascriptreact = typescript_commands,
	typescriptreact = typescript_commands,
	lua = lua_commands,
	python = python_commands,
	zig = zig_commands,
}

local function run_in_wezterm_pane(command_type)
	local filetype = vim.bo.filetype
	local full_path = vim.api.nvim_buf_get_name(0)
	local relative_filepath = vim.fn.expand("%:.")
	if commands[filetype] == nil or commands[filetype][command_type] == nil then
		print("No command found for " .. filetype .. " file type")
		return
	end

	local cmd = commands[filetype][command_type]
	local full_command = cmd(relative_filepath, full_path)
	wezterm_split()
	vim.defer_fn(function()
		wezterm_send_command(full_command)
	end, 1000)
end

vim.keymap.set("n", "<leader>ms", wezterm_split)

vim.keymap.set("n", "<leader>mx", wezterm_close_split, { noremap = true, desc = "Close wezterm split" })

vim.keymap.set("n", "<leader>mt", function()
	run_in_wezterm_pane("test")
end, { noremap = true, desc = "Run tests in wezterm pane" })

vim.keymap.set("n", "<leader>mr", function()
	run_in_wezterm_pane("run")
end, { noremap = true, desc = "Run file in wezterm pane" })
