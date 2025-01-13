local conform = require("conform")

conform.setup({
	formatters = {
		rubocop = {
			args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
		},
	},
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		ruby = { "rubocop", "solargraph" },
		javascript = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 5000,
	})
end, { desc = "Format file or range (in visual mode)" })
