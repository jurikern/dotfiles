return {
	"williamboman/mason.nvim",
  lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}
