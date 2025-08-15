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
      ensure_installed = {
        "ruby",
        "embedded_template",
        "lua",
        "json",
        "java",
        "yaml",
        "bash",
        "markdown",
        "markdown_inline",
      },
      ignore_install = {},
      indent = { enable = true },
      modules = {},
      sync_install = true,
    })
  end,
}
