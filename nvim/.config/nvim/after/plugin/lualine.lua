require('lualine').setup({
    theme = "catppuccin",
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
})

-- local ctp_feline = require('catppuccin.groups.integrations.feline')
--
-- ctp_feline.setup()
--
-- require("feline").setup({
--     components = ctp_feline.get(),
--     view = {
--         lsp = {
--             progress = false, -- if true the status bar will display an lsp progress indicator
--             name = false, -- if true the status bar will display the lsp servers name, otherwise it will display the text "Lsp"
--             exclude_lsp_names = {}, -- lsp server names that should not be displayed when name is set to true
--             separator = "|", -- the separator used when there are multiple lsp servers
--         },
--     }
-- })
