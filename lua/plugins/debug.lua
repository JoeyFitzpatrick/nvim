return {
	{
		"igorlfs/nvim-dap-view",
		lazy = false,
		enabled = false,
		version = "1.*",
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
		dependencies = { "mfussenegger/nvim-dap" },
	},
}
