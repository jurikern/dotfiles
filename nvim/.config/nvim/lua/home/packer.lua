vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
      "nvim-lualine/lualine.nvim",
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
  	"nvim-telescope/telescope.nvim", branch = "0.1.x",
  	requires = { {"nvim-lua/plenary.nvim"} }
  }
  use { "folke/tokyonight.nvim", as = "tokyonight" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "ThePrimeagen/harpoon" }
  use { "mbbill/undotree" }
  use { "tpope/vim-fugitive" }
  use {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    requires = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {"neovim/nvim-lspconfig"},
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"L3MON4D3/LuaSnip"},
    }
  }
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'folke/zen-mode.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
end)
