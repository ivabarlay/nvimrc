return {
    "mbbill/undotree",
    opts = {},
    --optional dependencies
    dependencies = {

    },
    config = function ()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}


