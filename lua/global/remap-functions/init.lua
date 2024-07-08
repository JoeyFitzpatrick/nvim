local find_special = require("global.remap-functions.find-special")

local M = {}

M.next_special = find_special.next_special
M.prev_special = find_special.prev_special

return M
