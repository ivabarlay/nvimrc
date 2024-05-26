return {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    config = function ()
        require("neotab").setup(
        {
            tabkey = "<Tab>",
            act_as_tab = true,
            behavior = "nested", ---@type ntab.behavior
            pairs = { ---@type ntab.pair[]
                { open = "(", close = ")" },
                { open = "[", close = "]" },
                { open = "{", close = "}" },
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = "`", close = "`" },
                { open = "<", close = ">" },
            },
            exclude = {},
            smart_punctuators = {
                enabled = false,
                semicolon = {
                    enabled = false,
                    ft = { "cs", "c", "cpp", "java" },
                },
                escape = {
                    enabled = false,
                    triggers = {}, ---@type table<string, ntab.trigger>
                },
            },
        }
        )
    end
}
