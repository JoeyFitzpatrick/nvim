require("lint").linters_by_ft = {
    markdown = { "vale" },
    javascript = { "eslint" },
    typescript = { "eslint" },
    haskell = { "hlint" },
    html = { "tidy" },
    -- sql = { "sqlfluff" },
}

local tidy = require('lint').linters.tidy
tidy.ignore_exitcode = true

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "oracle" }, -- change to your dialect
        }),
        null_ls.builtins.diagnostics.sqlfluff.with({
            extra_args = { "--dialect", "oracle" }, -- change to your dialect
        }),
        null_ls.builtins.formatting.jq,
    },
})
