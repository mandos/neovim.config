vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>hh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>hk", "<cmd>Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>")

return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	opts = require("plugins.telescope.options"),
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
}
