return {
    "mfussenegger/nvim-lint",
    config = function ()

        vim.env.ESLINT_D_PPID = vim.fn.getpid()
        require('lint').linters_by_ft = {
            javascript = {'eslint_d'},
            typescript = {'eslint_d'},
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()

                -- try_lint without arguments runs the linters defined in `linters_by_ft`
                -- for the current filetype
                require("lint").try_lint()

                require("lint").try_lint("eslint_d")
            end,
        })
    end
}
