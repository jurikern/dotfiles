require("zen-mode").setup({
    window = {
        backdrop = 1,
        width = 0.95,
        height = 1,
    },
    plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
        tmux = { enabled = true },
        kitty = {
          enabled = true,
          font = "+4",
        },
    },
})
