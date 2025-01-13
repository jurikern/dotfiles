return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      auto_install = true,
      highlight = {
        enable = true,
      },
      ensure_installed = {},
      ignore_install = {},
      indent = { enable = true },
      modules = {},
      sync_install = true,
    })
  end,
}
