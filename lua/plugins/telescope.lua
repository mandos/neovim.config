vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>hh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>hk", "<cmd>Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>")
return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = function()
		require("telescope").setup({

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
		})
	end,
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
}
