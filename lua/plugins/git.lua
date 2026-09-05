vim.keymap.set({ "n", "v" }, "g<space>", ":G ", { desc = "Trunks Git Prefix" })
vim.keymap.set("n", "<leader>je", "<cmd>G<CR>", { desc = "Open Trunks Home UI" })
vim.keymap.set("n", "<leader>jd", "<cmd>G difftool<CR>", { desc = "Open Trunks Difftool" })
vim.keymap.set("n", "<leader>jb", "<cmd>G blame<CR>", { desc = "Open Trunks Blame" })
vim.keymap.set("n", "<leader>jt", function()
	if vim.bo.filetype ~= "futitive" then
		vim.cmd("Git")
	end
	vim.cmd("Twiggy")
end, { desc = "Open Git Branch with Twiggy" })
vim.keymap.set("n", "<leader>jm", "<cmd>G mergetool<CR>", { desc = "Open Mergetool" })
vim.keymap.set("n", "<leader>jl", "<cmd>G log<CR>", { desc = "Open Git Log" })

vim.keymap.set("n", "<leader>jg", "<cmd>Guh<CR>", { desc = "Open Guh" })

vim.keymap.set("n", "<leader>jc", function()
	local root = vim.fs.root(0, ".git")
	if not root then
		vim.notify("gh pr create: not inside a git repository", vim.log.levels.ERROR)
		return
	end

	local log = vim.system({ "git", "log", "-1", "--format=%s" }, { cwd = root, text = true }):wait()
	local title = vim.trim(log.stdout or "")
	if log.code ~= 0 or title == "" then
		vim.notify("gh pr create: could not read commit subject: " .. vim.trim(log.stderr or ""), vim.log.levels.ERROR)
		return
	end

	local args = { "gh", "pr", "create", "--title", title, "--editor" }
	local template = vim.fs.find(function(name)
		return name:lower() == "pull_request_template.md"
	end, { path = root, type = "file", limit = 1 })[1]
	if template then
		vim.list_extend(args, { "--template", vim.fs.basename(template) })
	end

	local cmd = table.concat(vim.tbl_map(vim.fn.shellescape, args), " ") .. " && gh pr view --web"
	vim.cmd.tabnew()
	vim.fn.jobstart(cmd, {
		term = true,
		cwd = root,
		on_exit = function(_, code)
			if code ~= 0 then
				vim.notify("gh pr create: exited with code " .. code, vim.log.levels.WARN)
			end
		end,
	})
end, { desc = "Create GitHub pull request from last commit subject" })

vim.keymap.set(
	"n",
	"<leader>jC",
	"<cmd>tab term gh pr create<CR>",
	{ desc = "Create GitHub pull request with no flags" }
)

return {
	{ dir = "~/plugins/vim-fugitive", name = "vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "sodapopcan/vim-twiggy" },
	{ "justinmk/guh.nvim" },
	{
		"barrettruth/diffs.nvim",
		init = function()
			vim.g.diffs = { integrations = { fugitive = true } }
		end,
	},
}
