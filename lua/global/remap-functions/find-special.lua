local M = {}

local pattern = [[\v['"({[<> ]@<=(\w)|^(\w)|(['"\>)}]\.)@<=(\w)|(['"])@<=([][(){}.,;])(['"])]]

M.next_special = function()
	vim.fn.search(pattern)
end

M.prev_special = function()
	vim.fn.search(pattern, "b")
end

return M
