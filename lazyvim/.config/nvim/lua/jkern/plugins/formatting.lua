return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        rubocop = {
          command = require("conform.util").find_executable({
            vim.fn.expand("$HOME/.rbenv/shims/rubocop"),
            "rubocop",
          }),
          args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
          stdin = true,
        },
        -- no explicit java formatter needed when using LSP
      },
      formatters_by_ft = {
        ruby = { "rubocop" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        java = { "lsp" },  -- Use jdtls LSP formatting
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
