return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			sync_install = false,
			ignore_install = {},
			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = { enable = true },
			indent = { enable = true },
			textobjects = { enable = true },
			ensure_installed = {
				"hcl",
				"json",
				"lua",
				"luadoc",
				"haskell",
				"markdown",
				"org",
				"rust",
				"terraform",
				"vim",
				"vimdoc",
				"query",
				"yaml",
			},
		})
	end,
}
