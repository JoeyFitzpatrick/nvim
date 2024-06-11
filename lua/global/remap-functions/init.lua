local find_special_char = require("global.remap-functions.find-special-char")

local M = {}

M.find_next_special_char = find_special_char.find_next_special_char
M.find_previous_special_char = find_special_char.find_previous_special_char

return M
