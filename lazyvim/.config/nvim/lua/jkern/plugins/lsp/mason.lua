return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"gopls",
				"ruby_lsp",
				"rust_analyzer",
				"solargraph",
				"standardrb",
				"lua_ls",
			},
			automatic_installation = false,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"rubocop",
				"golangci-lint",
				"stylua",
				"isort",
				"black",
				"lua-language-server",
				"gopls",
				"gofumpt",
				"golines",
				"gomodifytags",
				"gotests",
				"json-to-struct",
				"misspell",
			},
		})
	end,
}
