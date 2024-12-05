vim.api.nvim_set_keymap("n", "<leader>op", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "kyazdani42/nvim-web-devicons", lazy = true },
		{ "MunifTanjim/nui.nvim", lazy = true },
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden files/directories
				},
			},
		})
	end,
}
