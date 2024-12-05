return {
	defaults = {

		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			vertical = { mirror = true },
		},
	},
}
