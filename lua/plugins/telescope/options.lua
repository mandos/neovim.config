return {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
		layout_config = {
                prompt_position = "top",
					vertical = { mirror = true },
		},
	},
}
