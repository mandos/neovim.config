return {
	"folke/which-key.nvim",
	enabled = true,
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "modern",
			filter = function(mapping)
				if mapping.desc then
					return not mapping.desc:match("wk%-ignore")
				else
					return true
				end
			end,
		})
		wk.add({
			{ "<leader>b", group = "buffors" }, -- group
			{ "<leader>c", group = "code" }, -- group
			{ "<leader>f", group = "files" }, -- group
			{ "<leader>h", group = "help" }, -- group
			{ "<leader>l", group = "lsp" },
			{ "<leader>o", group = "open" }, -- group
			{ "<leader>t", group = "toogle" }, -- group
			{ "<leader>s", group = "search" }, -- group
			{ "<leader>w", group = "windows" }, -- group
		})
	end,
}
