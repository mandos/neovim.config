return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	dependencies = {
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local ls = require("luasnip")

		ls.setup({
			enable_autosnippets = true,
			updateevents = "TextChanged,TextChangedI",
		})

		vim.keymap.set({ "i" }, "<C-e>", function()
			if ls.expandable() then
				ls.expand()
			else
				return "<C-e>"
			end
		end, { silent = true })

		local debug = require("core.utils").var_dump
		vim.keymap.set({ "i", "s" }, "<Tab>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			else
				local key = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
				vim.api.nvim_feedkeys(key, "n", false)
			end
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			else
				local key = vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true)
				vim.api.nvim_feedkeys(key, "n", false)
			end
		end, { silent = true })
	end,
}
