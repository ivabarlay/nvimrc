return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        -- get access to the none-ls functions
        local null_ls = require("null-ls")
        -- run the setup function for none-ls to setup our different formatters
        null_ls.setup({
            sources = {
                -- setup lua formatter
                null_ls.builtins.formatting.stylua,
                -- setup C formatter
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "-style={BasedOnStyle: llvm, IndentWidth: 4}" },
                }),
                -- setup eslint linter for javascript
                require("none-ls.diagnostics.eslint_d"),
                -- setup prettier to format languages that are not lua
                null_ls.builtins.formatting.prettier.with({
                    extra_args = function(params)
                        return params.options
                            and params.options.tabSize
                            and {
                                "--tab-width",
                                params.options.tabSize
                            }
                    end
                })
            }
        })

        -- set up a vim motion for <Space> + c + f to automatically format our code based on which langauge server is active
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
    end
}
