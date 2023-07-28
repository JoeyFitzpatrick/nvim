return {
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
}
--
-- return {
-- 	"dpayne/CodeGPT.nvim",
-- 	lazy = false,
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		require("codegpt.config")
-- 		-- vim.g["codegpt_commands_defaults"] = {
-- 		-- 	["completion"] = {
-- 		-- 		model = "gpt-4",
-- 		-- 	},
-- 		-- }
-- 	end,
-- }
