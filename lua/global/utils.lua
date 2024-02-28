local typescript_commands = {
	lint = "eslint_d --fix --cache",
	format = "npx prettier --write",
}

local function run_command(command)
	local filetype = vim.bo.filetype
	local filename = vim.api.nvim_buf_get_name(0)
	local commands = {
		javascript = typescript_commands,
		typescript = typescript_commands,
		javascriptreact = typescript_commands,
		typescriptreact = typescript_commands,
		prisma = { format = "npx prisma format" },
	}

	if commands[filetype] ~= nil and commands[filetype][command] ~= nil then
		local full_command = commands[filetype][command] .. " " .. filename
		vim.cmd("w")
		os.execute(full_command)
		vim.cmd("e!")
		print(full_command)
	else
		print("No command found for " .. filetype .. " file type and command " .. command)
	end
end

vim.keymap.set("n", "<leader>cl", function()
	run_command("lint")
end, { noremap = true, desc = "[C]ustom [l]inter" })

vim.keymap.set("n", "<leader>cf", function()
	run_command("format")
end, { noremap = true, desc = "[C]ustom [f]ormatter" })

local loaded_clients = {}

local function trigger_workspace_diagnostics(client, bufnr, workspace_files)
	if vim.tbl_contains(loaded_clients, client.id) then
		return
	end
	table.insert(loaded_clients, client.id)

	if not vim.tbl_get(client.server_capabilities, "textDocumentSync", "openClose") then
		return
	end

	for _, path in ipairs(workspace_files) do
		if path == vim.api.nvim_buf_get_name(bufnr) then
			goto continue
		end

		local filetype = vim.filetype.match({ filename = path })

		if not vim.tbl_contains(client.config.filetypes, filetype) then
			goto continue
		end

		local params = {
			textDocument = {
				uri = vim.uri_from_fname(path),
				version = 0,
				text = vim.fn.join(vim.fn.readfile(path), "\n"),
				languageId = filetype,
			},
		}
		client.notify("textDocument/didOpen", params)

		::continue::
	end
end

local workspace_files = vim.fn.split(vim.fn.system("fd . 'src/shared'"), "\n")
-- convert paths to absolute
for i, path in ipairs(workspace_files) do
	workspace_files[i] = vim.fn.fnamemodify(path, ":p")
end

local M = {}
M.run_command = run_command
M.get_visual_selection = function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})
	return text or ""
end
M.trigger_workspace_diagnostics = trigger_workspace_diagnostics
M.workspace_files = workspace_files

return M
