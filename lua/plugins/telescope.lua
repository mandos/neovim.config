vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Open files" })
vim.keymap.set("n", "<leader>fp", function()
	require("telescope.builtin").find_files({
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Open Neovim configurtion file" })

vim.keymap.set("n", "<leader>hh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>hk", "<cmd>Telescope keymaps<cr>")

vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>")

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
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
}
