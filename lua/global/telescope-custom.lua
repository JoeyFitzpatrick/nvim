local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

M.git_commands = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "git commands",
			finder = finders.new_table({
				results = vim.fn.systemlist("bat ~/.config/nvim/scripts/git-commands.txt"),
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local command = action_state.get_selected_entry()[1]
					vim.fn.system(command)
				end)
				return true
			end,
		})
		:find()
end

return M
