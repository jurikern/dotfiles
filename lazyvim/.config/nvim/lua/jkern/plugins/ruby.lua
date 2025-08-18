return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

        local on_attach = function(client, bufnr)
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
          end
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "K",  vim.lsp.buf.hover, "Hover")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }

        local function in_bundle()
          local uv = vim.uv or vim.loop
          local cwd = uv.cwd()
          local function exists(p) return uv.fs_stat(p) ~= nil end
          return exists(cwd .. "/Gemfile") or exists(cwd .. "/.bundle")
        end

        lspconfig.ruby_lsp.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = in_bundle() and { "bundle", "exec", "ruby-lsp" } or { "ruby-lsp" },
          init_options = { formatter = "none" }
        })       
    end
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}

      local function in_bundle()
        local uv = vim.uv or vim.loop
        local cwd = uv.cwd()
        local function exists(p) return uv.fs_stat(p) ~= nil end
        return exists(cwd .. "/Gemfile") or exists(cwd .. "/.bundle")
      end

      opts.formatters.rubocop = vim.tbl_deep_extend("force", opts.formatters.rubocop or {}, {
        command = in_bundle() and "bundle" or "rubocop",
        args = (function()
          local base = { "rubocop", "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" }
          return in_bundle() and vim.list_extend({ "exec" }, base) or base
        end)(),
        stdin = true,
      })

      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        go = { "goimports", "gofmt" },
        rust = { "rustfmt", lsp_format = "fallback" },
        ruby = { "rubocop" },
        javascript = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      })

      opts.notify_on_error = true
      opts.format_on_save = nil
    end,

    keys = {
      {
        "<leader>mp",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 5000,
          })
        end,
        mode = { "n", "v" },
        desc = "Format (Conform)",
      },
    },
  },
}
