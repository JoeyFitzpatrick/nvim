local function run_command(command)
	local filetype = vim.bo.filetype
	local filename = vim.api.nvim_buf_get_name(0)
	local commands = {
		javascript = { lint = "eslint_d --fix --cache", format = "npx prettier --write" },
		typescript = { lint = "eslint_d --fix --cache", format = "npx prettier --write" },
		javascriptreact = { lint = "eslint_d --fix --cache", format = "npx prettier --write" },
		typescriptreact = { lint = "eslint_d --fix --cache", format = "npx prettier --write" },
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
