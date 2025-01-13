vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")

keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

vim.g.diag_vis = true

keymap.set("n", "<leader>sw", function()
    if vim.g.diag_vis then
        vim.diagnostic.disable()
        vim.g.diag_vis = false
    else
        vim.diagnostic.enable()
        vim.g.diag_vis = true
    end
end, { noremap = true })
