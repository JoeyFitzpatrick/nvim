M = {}

local utils = require("telescope.actions.utils")
local actions = require("telescope.actions")

M.mark_file = function(tb)
  actions.drop_all(tb)
  actions.add_selection(tb)
  utils.map_selections(tb, function(selection)
    local s = selection[1]
    if s:find(':') then s = s:match('^(.-):') end
    pcall(require('harpoon.mark').add_file, s)
  end)
  actions.move_selection_worse(tb)
  actions.remove_selection(tb)
end

return M
