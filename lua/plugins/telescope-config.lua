return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-project.nvim',
    },
    config = function()
local builtin = require("telescope.builtin")
        require('telescope').setup {
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        ["<C-q>"] = builtin.quickfix,
                        ["<C-a>"] = require('telescope-harpoon').mark_file,
                    }
                }
            },
        }
    end
}
