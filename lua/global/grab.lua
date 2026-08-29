local function get_commit_hash()
	local line_num = tostring(vim.api.nvim_win_get_cursor(0)[1])
	local result = vim.system({ "git", "blame", "-l", "-L", line_num .. "," .. line_num, vim.api.nvim_buf_get_name(0) })
		:wait()
	if result.code ~= 0 then
		return { hash = nil, err = "grab: unable to run git blame: " .. result.stderr }
	end
	return { hash = result.stdout:match("%x+"), err = nil }
end

local function get_pull_request(hash)
	local result = vim.system({
		"sh",
		"-c",
		"gh pr list --search "
			.. hash
			.. " --state merged --json number --jq '.[0].number'"
			.. " | xargs -I {} gh pr view {} --json body --jq '.body'",
	}):wait()

	if result.code ~= 0 then
		return { description = nil, err = "grab: unable to fetch PR: " .. result.stderr }
	end
	return { description = result.stdout, err = nil }
end

---@param description string
local function display_pull_request(description)
	vim.cmd("tabnew")
	vim.bo.filetype = "markdown"
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
	local desc_as_tbl = vim.split(description, "\r?\n", { plain = false })
	vim.api.nvim_buf_set_lines(0, 0, -1, false, desc_as_tbl)
end

vim.api.nvim_create_user_command("Grab", function(args)
	local qflist = {}
	local hash_result = get_commit_hash()
	if hash_result.err then
		vim.notify(hash_result.err, vim.log.levels.ERROR)
		return
	end

	local hash = hash_result.hash
	local fugitive_uri = string.format("fugitive://%s/.git//%s", vim.fn.expand("%:p:h"), hash)
	table.insert(qflist, { filename = fugitive_uri })
	local pull_request_result = get_pull_request(hash)
	if pull_request_result.err then
		vim.notify(pull_request_result.err, vim.log.levels.ERROR)
		return
	end
	display_pull_request(pull_request_result.description)
	vim.fn.setqflist(qflist)
	vim.cmd.copen()
end, {})

vim.keymap.set("n", "gb", "<cmd>Grab<CR>", { desc = "Run Grab" })
