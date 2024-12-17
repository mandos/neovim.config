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

		-- NOTE: Pairs
		require("mini.pairs").setup({})
		-- NOTE: Surround
		require("mini.surround").setup({
			mappings = {
				add = "ys",
				delete = "ds",
				find = "",
				find_left = "",
				highlight = "",
				replace = "cs",
				update_n_lines = "",

				-- Add this only if you don't want to use extended mappings
				suffix_last = "",
				suffix_next = "",
			},
		})

		-- local miniclue = require("mini.clue")
		-- miniclue.setup({
		-- 	triggers = {
		-- 		{ mode = "n", keys = "gnn" },
		-- 	},
		--
		-- 	clues = {
		-- 		-- Enhance this by adding descriptions for <Leader> mapping groups
		-- 		-- miniclue.gen_clues.builtin_completion(),
		-- 		-- miniclue.gen_clues.g(),
		-- 		-- miniclue.gen_clues.marks(),
		-- 		-- miniclue.gen_clues.registers(),
		-- 		-- miniclue.gen_clues.windows(),
		-- 		-- miniclue.gen_clues.z(),
		-- 	},
		-- })
	end,
}
