return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,

          mappings = {
            ["i"] = {
            },
            ["n"] = {
            },
          },


        },
      },
    })
    require('telescope').load_extension('fzf')
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("frecency")

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
    keymap.set("n", "<space>fb", ":Telescope file_browser<cr>")
  end,
}
