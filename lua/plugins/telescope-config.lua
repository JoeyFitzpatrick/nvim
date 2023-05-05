return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-project.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
require 'telescope'.load_extension('project')

local project_actions = require("telescope._extensions.project.actions")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
        require('telescope').setup {
            extensions = {
                project = {
                    base_dirs = {
                        { '~/Tools/bitbucket/', max_depth = 4 },
                        { '~/.config/nvim',     max_depth = 2 },
                        -- {path = '~/dev/src4'},
                        -- {path = '~/dev/src5', max_depth = 2},
                    },
                    hidden_files = true, -- default: false
                    theme = "dropdown",
                    order_by = "asc",
                    search_by = "title",
                    sync_with_nvim_tree = true, -- default false
                    on_project_selected = function(prompt_bufnr)
                        -- Do anything you want in here. For example:
                        project_actions.change_working_directory(prompt_bufnr, false)
                    end
                }
            },
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
