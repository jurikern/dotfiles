vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>pc", vim.cmd.NvimTreeClose)
local api = require "nvim-tree.api"
vim.keymap.set("n", "<leader>pa", function()
  api.tree.open({
    path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h"),
    find_file = true,
  })
end, { noremap = true })
