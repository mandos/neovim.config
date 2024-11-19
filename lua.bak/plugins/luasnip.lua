return {
	"L3MON4D3/LuaSnip",
    tag = "v2.2.0",
	build = "make install_jsregexp",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip").setup({
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			ext_opts = {},
		})
		require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
	end,
}
