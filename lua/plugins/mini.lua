vim.api.nvim_set_keymap(
	"n",
	"<leader>bd",
	"<cmd>lua require('mini.bufremove').delete(0, false)<CR>",
	{ noremap = true, silent = true }
)

return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- NOTE: Buffer removal
		require("mini.bufremove").setup({
			-- Whether to set Vim's settings for buffers (allow hidden buffers)
			set_vim_settings = false,
		})
	end,
}
