local bg = "#011628"
local bg_dark = "#011423"
local bg_highlight = "#143652"
local bg_search = "#0A64AC"
local bg_visual = "#275378"
local fg = "#CBE0F0"
local fg_dark = "#B4D0E9"
local fg_gutter = "#627E97"
local border = "#547998"

require("tokyonight").setup({
  style = "storm",
  transparent = true,
  on_colors = function(colors)
    colors.bg = bg
    colors.bg_dark = bg_dark
    colors.bg_float = bg_dark
    colors.bg_highlight = bg_highlight
    colors.bg_popup = bg_dark
    colors.bg_search = bg_search
    colors.bg_sidebar = bg_dark
    colors.bg_statusline = bg_dark
    colors.bg_visual = bg_visual
    colors.border = border
    colors.fg = fg
    colors.fg_dark = fg_dark
    colors.fg_float = fg
    colors.fg_gutter = fg_gutter
    colors.fg_sidebar = fg_dark
  end,
})

vim.cmd.colorscheme("tokyonight")

local api = vim.api

api.nvim_set_hl(0, "Normal", { bg = "none" })
api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none"  })

api.nvim_set_hl(0, 'LineNrAbove', { fg='#89dceb', bold=true })
api.nvim_set_hl(0, 'LineNr', { fg='#cdd6f4', bold=true })
api.nvim_set_hl(0, 'LineNrBelow', { fg='#eba0ac', bold=true })
