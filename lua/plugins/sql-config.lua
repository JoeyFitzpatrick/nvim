return {
		"kndndrj/nvim-dbee",
		lazy = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup({
				sources = {
					require("dbee.sources").MemorySource:new({
						{
							name = "sadev",
							type = "oracle",
							-- url = "oracle://fitzpj3:Atlas89*@SADEV.OAS.VANDERBILT:30000",
							url = "oracle://vuadm:vuadm89@dbu24ld.it.vanderbilt.edu:30000/SADEV.vuit.vanderbilt"
							-- url = "oracle://fitzpj3:Atlas89*@dbu24ld.it.vanderbilt.edu:30000/SADEV.vuit.vanderbilt"

    -- (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = dbu24ld.it.vanderbilt.edu)(PORT = 30000))) 
						},
					}),
					require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
					require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
				},
			})
		end,
	}
-- return {
-- 	"tpope/vim-dadbod",
-- 	{
-- 		"kristijanhusak/vim-dadbod-ui",
-- 		config = function()
-- 			vim.keymap.set("n", "<leader>db", ":DBUI<CR>")
-- 			vim.cmd([[
--             let g:dbs = {
--                 \ 'dev': 'oracle://fitzpj3:Atlas89*@sadev',
--                 \ 'vuadm dev': 'oracle://vuadm:vuadm89@sadev',
--                 \ }
--             ]])
-- 		end,
-- 	},
-- 	{
-- 		"kristijanhusak/vim-dadbod-completion",
-- 		config = function()
-- 			vim.keymap.set("n", "<leader>db", ":DBUI<CR>")
-- 			-- vim.cmd([[
--                   -- autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
--             -- ]])
-- 		end,
-- 	},
-- }
