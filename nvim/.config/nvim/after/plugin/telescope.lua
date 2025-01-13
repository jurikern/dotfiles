local builtin = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		path_display = { "smart" },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

require('telescope').load_extension('fzy_native')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
