vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("romgrk/barbar.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"nvim-telescope/telescope-fzy-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use("folke/tokyonight.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("stevearc/conform.nvim")
	use("mfussenegger/nvim-lint")
	use("kylechui/nvim-surround")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"kenn7/vim-arsync",
		requires = { "prabirshrestha/async.vim" },
	})
	use("szw/vim-maximizer")
	use({
		"windwp/nvim-autopairs",
		requires = { "hrsh7th/nvim-cmp" },
	})
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
	})
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
end)
