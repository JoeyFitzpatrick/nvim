local M = {}
local docs_debounce_ms = 100
local docs_timer = vim.uv.new_timer()

function stop(entry)
	if not entry then
		return
	end

	if entry.timer then
		entry.timer:close()
		entry.timer:stop()
		entry.timer = nil
	end

	if entry.cancel then
		entry.cancel()
		entry.cancel = nil
	end
end
function debounce(entry, ms, func)
	if not entry then
		return
	end

	stop(entry)
	entry.timer = vim.uv.new_timer()
	entry.timer:start(
		ms,
		0,
		vim.schedule_wrap(function()
			entry.cancel = func()
		end)
	)
end

local methods = vim.lsp.protocol.Methods

local state = {
	entry = nil,
}

local function enable_completion_documentation(client, augroup, bufnr)
	if not docs_timer then
		vim.notify("cannot create timer", vim.log.levels.ERROR)
		return
	end

	vim.api.nvim_create_autocmd("CompleteChanged", {
		group = augroup,
		buffer = bufnr,
		callback = function()
			docs_timer:stop()

			local client_id = vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "client_id")
			if client_id ~= client.id then
				return
			end

			local completion_item = vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "completion_item")
			if not completion_item then
				return
			end

			local complete_info = vim.fn.complete_info({ "selected" })
			if vim.tbl_isempty(complete_info) then
				return
			end

			docs_timer:start(
				docs_debounce_ms,
				0,
				vim.schedule_wrap(function()
					client.request(
						vim.lsp.protocol.Methods.completionItem_resolve,
						completion_item,
						---@param err lsp.ResponseError
						---@param result any
						function(err, result)
							if err ~= nil then
								vim.notify("client " .. client.id .. vim.inspect(err), vim.log.levels.ERROR)
								return
							end

							local docs = vim.tbl_get(result, "documentation", "value")
							if not docs then
								return
							end

							local wininfo = vim.api.nvim__complete_set(complete_info.selected, { info = docs })
							if vim.tbl_isempty(wininfo) or not vim.api.nvim_win_is_valid(wininfo.winid) then
								return
							end

							vim.api.nvim_win_set_config(wininfo.winid, { border = "rounded" })
							vim.wo[wininfo.winid].conceallevel = 2
							vim.wo[wininfo.winid].concealcursor = "niv"

							if not vim.api.nvim_buf_is_valid(wininfo.bufnr) then
								return
							end

							vim.bo[wininfo.bufnr].syntax = "markdown"
							vim.treesitter.start(wininfo.bufnr, "markdown")
						end,
						bufnr
					)
				end)
			)
		end,
	})
end

function M.setup()
	state.entry = {}

	local group = vim.api.nvim_create_augroup("LspCompletion", { clear = true })

	vim.api.nvim_create_autocmd("LspAttach", {
		group = group,
		desc = "Attach completion events",
		callback = function(args)
			if not vim.lsp.completion or not vim.lsp.completion.enable then
				return
			end

			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end
			if not client:supports_method(methods.textDocument_completion, args.buf) then
				return
			end

			vim.lsp.completion.enable(true, client.id, args.buf, {
				autotrigger = true,
				convert = function(item)
					local entry = {
						abbr = item.label,
						kind = vim.lsp.protocol.CompletionItemKind[item.kind] or "Unknown",
						menu = item.detail or "",
						icase = 1,
						dup = 0,
						empty = 0,
					}

					return entry
				end,
			})

			-- Enable completion documentation preview window
			local docs_augroup = vim.api.nvim_create_augroup("lsp-completion-docs-" .. client.id, { clear = true })
			enable_completion_documentation(client, docs_augroup, args.buf)
		end,
	})
end

return M
