return {
	"lukas-reineke/indent-blankline.nvim",
	-- Pin it because it only works with the newest version of Neovim which I sometimes don't use.
	version = "3.6.2",
	event = "BufReadPre",
	main = "ibl",
	config = function()
		vim.keymap.set("n", "<leader>ti", "<cmd>IBLToggle<cr>")
		require("ibl").setup({
			enabled = false,
			indent = {
				char = { "|", "¦", "┆", "┊" },
			},
		})
	end,
}
