return {
    "mbbill/undotree",
    opts = {},
    --optional dependencies
    dependencies = {

    },
    config = function ()
        vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = "[U]ndo [T]ree"})
    end
}


