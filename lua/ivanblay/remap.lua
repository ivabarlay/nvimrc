vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Lexplore<CR>")
vim.keymap.set("n", "<leader>c", ":close<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
