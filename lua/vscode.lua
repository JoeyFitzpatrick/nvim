local M = {}

local augroup = vim.api.nvim_create_augroup
local keymap = vim.api.nvim_set_keymap

M.my_vscode = augroup('MyVSCode', {})

vim.filetype.add {
    pattern = {
        ['.*%.ipynb.*'] = 'python',
        -- uses lua pattern matching
        -- rathen than naive matching
    },
}

local function notify(cmd)
    return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
    return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end

vim.g.mapleader = " "

keymap('n', 'H', notify('workbench.action.previousEditor'), { silent = true })
keymap('n', 'L', notify('workbench.action.nextEditor'), { silent = true })

keymap('n', '<leader>fr', notify('references-view.findReferences'), { silent = true }) -- language references
keymap('n', '<leader>vp', notify ('workbench.actions.view.problems'), { silent = true }) -- language diagnostics
keymap('n', 'gr', notify ('editor.action.goToReferences'), { silent = true })
keymap('n', 'gi', notify ('editor.action.goToImplementation'), { silent = true })
keymap('n', '<leader>rn', notify ('editor.action.rename'), { silent = true })
keymap('n', '<leader>fd', notify ('editor.action.formatDocument'), { silent = true })
keymap('v', '<leader>fs', v_notify ('editor.action.formatSelection'), { silent = true })
keymap('n', '<leader>rf', notify ('editor.action.refactor'), { silent = true }) -- language code actions

keymap('n', '<leader>sf', notify ('workbench.action.findInFiles'), { silent = true }) -- use ripgrep to search files
-- keymap('n', '<leader>ts', notify ('workbench.action.toggleSidebarVisibility'), { silent = true })
-- keymap('n', '<leader>th', notify ('workbench.action.toggleAuxiliaryBar'), { silent = true }) -- toggle docview (help page)
-- keymap('n', '<leader>tp', notify ('workbench.action.togglePanel'), { silent = true })
-- keymap('n', '<leader>tw', notify ('workbench.action.terminal.toggleTerminal'), { silent = true }) -- terminal window
keymap('n', '<leader>sc', notify ('workbench.action.showCommands'), { silent = true }) -- find commands
keymap('v', '<leader>sc', v_notify ('workbench.action.showCommands'), { silent = true })
keymap('n', '<leader>ch', notify ('references-view.showCallHierarchy'), { silent = true }) -- show call hierarchy of function
keymap('n', '<leader>ff', notify ('workbench.action.quickOpen'), { silent = true }) -- find files


keymap('n', '<leader>ba', notify ('numberedBookmarks.jumpToBookmark1'), { silent = true }) -- remap numbered bookmark
keymap('n', '<leader>bs', notify ('numberedBookmarks.jumpToBookmark2'), { silent = true })
keymap('n', '<leader>bd', notify ('numberedBookmarks.jumpToBookmark3'), { silent = true })
keymap('n', '<leader>bf', notify ('numberedBookmarks.jumpToBookmark4'), { silent = true })
keymap('n', '<leader>bg', notify ('numberedBookmarks.jumpToBookmark5'), { silent = true })
keymap('n', '<leader>bq', notify ('numberedBookmarks.jumpToBookmark6'), { silent = true })
keymap('n', '<leader>bw', notify ('numberedBookmarks.jumpToBookmark7'), { silent = true })
keymap('n', '<leader>be', notify ('numberedBookmarks.jumpToBookmark8'), { silent = true })
keymap('n', '<leader>br', notify ('numberedBookmarks.jumpToBookmark9'), { silent = true })

keymap('n', '<leader>ma', notify ('numberedBookmarks.toggleBookmark1'), { silent = true }) -- remap numbered bookmark
keymap('n', '<leader>ms', notify ('numberedBookmarks.toggleBookmark2'), { silent = true })
keymap('n', '<leader>md', notify ('numberedBookmarks.toggleBookmark3'), { silent = true })
keymap('n', '<leader>mf', notify ('numberedBookmarks.toggleBookmark4'), { silent = true })
keymap('n', '<leader>mg', notify ('numberedBookmarks.toggleBookmark5'), { silent = true })
keymap('n', '<leader>mq', notify ('numberedBookmarks.toggleBookmark6'), { silent = true })
keymap('n', '<leader>mw', notify ('numberedBookmarks.toggleBookmark7'), { silent = true })
keymap('n', '<leader>me', notify ('numberedBookmarks.toggleBookmark8'), { silent = true })
keymap('n', '<leader>mr', notify ('numberedBookmarks.toggleBookmark9'), { silent = true })

keymap('n', '<leader>bl', notify ('numberedBookmarks.listFromAllFiles'), { silent = true })
keymap('n', '<leader>bc', notify ('numberedBookmarks.clearFromAllFiles'), { silent = true })
return M
