require'telescope'.load_extension('project')

local project_actions = require("telescope._extensions.project.actions")
require('telescope').setup {
  extensions = {
    project = {
      base_dirs = {
        { '~/Tools/bitbucket/', max_depth = 4 },
        -- { '~/Tools/bitbucket/web/student-search', max_depth = 4 },
        -- {'~/dev/src3', max_depth = 4},
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
  }
}

vim.keymap.set( 'n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})
