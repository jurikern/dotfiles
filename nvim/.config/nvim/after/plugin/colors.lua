require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = true, -- Force no underline
    default_integrations = false,
    integrations = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
        harpoon = true,
    },
})

require("tokyonight").setup({
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
    on_colors = function (colors)
        colors.fg_gutter = "#b2b8cf"
    end
})

vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none"  })
