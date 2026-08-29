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
	local list_result = vim.system({
		"gh",
		"pr",
		"list",
		"--search",
		hash,
		"--state",
		"merged",
		"--json",
		"number",
		"--jq",
		".[0].number",
	}):wait()

	if list_result.code ~= 0 then
		return { number = nil, description = nil, err = "grab: unable to find PR: " .. list_result.stderr }
	end

	local number = vim.trim(list_result.stdout)
	if not number then
		return { number = nil, description = nil, err = "grab: no merged PR found for " .. hash }
	end

	local view_result = vim.system({
		"gh",
		"pr",
		"view",
		number,
		"--json",
		"body",
		"--jq",
		".body",
	}):wait()

	if view_result.code ~= 0 then
		return { number = number, description = nil, err = "grab: unable to fetch PR body: " .. view_result.stderr }
	end
	return { number = number, description = view_result.stdout, err = nil }
end

local function set_buf_opts(bufnr)
	vim.bo[bufnr].filetype = "markdown"
	vim.bo[bufnr].buftype = "nofile"
	vim.bo[bufnr].bufhidden = "hide"
	vim.bo[bufnr].swapfile = false
end

local pull_request_data = {}

vim.api.nvim_create_user_command("Grab", function(args)
	local qflist = {}
	local hash_result = get_commit_hash()
	if hash_result.err then
		vim.notify(hash_result.err, vim.log.levels.ERROR)
		return
	end

	local hash = hash_result.hash
	local fugitive_path = vim.fn.FugitiveFind(hash)
	if fugitive_path == "" then
		vim.notify("grab: not in a git repository", vim.log.levels.ERROR)
		return
	end
	table.insert(qflist, { filename = fugitive_path, module = "Commit: " .. hash:sub(1, 8) })

	local pull_request_result = get_pull_request(hash)
	if pull_request_result.err then
		vim.notify(pull_request_result.err, vim.log.levels.ERROR)
		return
	end
	local desc_as_tbl = vim.split(pull_request_result.description, "\r?\n", { plain = false })
	pull_request_data = {
		description = desc_as_tbl,
		number = pull_request_result.number,
	}
	table.insert(qflist, {
		filename = "github://" .. pull_request_result.number,
		module = "Pull Request: " .. pull_request_result.number:sub(1, 8),
	})

	vim.fn.setqflist(qflist)
	vim.cmd.copen()
end, {})

vim.keymap.set("n", "gb", "<cmd>Grab<CR>", { desc = "Run Grab" })

local augroup = vim.api.nvim_create_augroup("Grab", {})
vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup,
	callback = function(data)
		set_buf_opts(data.buf)
		vim.api.nvim_buf_set_lines(data.buf, 0, -1, false, pull_request_data.description)
	end,
	pattern = "github://*",
})
