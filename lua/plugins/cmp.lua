return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-calc" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "onsails/lspkind-nvim" },
	},
	config = function()
		local lspkind = require("lspkind")
		local cmp = require("cmp")

		cmp.setup({
			enabled = true,
			performance = {
				-- debounce = 200,
				-- throttle = 80,
				-- fetching_timeout = 1000,
			},
			preselect = cmp.PreselectMode.None,
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-i>"] = cmp.mapping.close(),
				["<C-e>"] = nil,
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			comletion = {
				-- keyword_length = 2,
				-- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\%(\.\w*\)*\)]],
				-- autocomplete = true,
				-- completeopt = "menu,menuone,noselect",
			},
			confirmation = {
				-- get_commit_characters = function()
				--     return vim.tbl_filter(function(char)
				--         return char ~= " "
				--     end, vim.api.nvim_get_var("cmp_commit_characters"))
				-- end,
			},
			formatting = {
				-- expandable_indicator = "",
				-- fields = { "kind", "menu", "abbr", "type", "text" },
				format = function(entry, vim_item)
					vim_item.kind = lspkind.presets.default[vim_item.kind]
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						nvim_lua = "[Lua]",
						luasnip = "[LuaSnip]",
						buffer = "[BUF]",
					})[entry.source.name]
					return vim_item
				end,
			},
			-- formatting = {
			--     format = lspkind.cmp_format({
			--         mode = "symbol_text",
			--         maxwidth = 50,
			--         -- before = function (entry, vim_item)
			--         --   return vim_item
			--         -- end
			--     }),
			-- },
			matching = {
				-- disallow_fuzzy_matching = true,
				-- disallow_fullfuzzy_matching = true,
				-- disallow_partial_fuzzy_matching = true,
				-- disallow_partial_matching = true,
				-- disallow_prefix_unmatching = true,
			},
			sorting = {
				-- priority_weight = 2,
				-- comparators = {
				--     cmp.config.compare.offset,
				--     cmp.config.compare.exact,
				--     cmp.config.compare.score,
				--     cmp.config.compare.kind,
				--     cmp.config.compare.sort_text,
				--     cmp.config.compare.length,
				--     cmp.config.compare.order,
				-- },
			},
			sources = {
				{ name = "luasnip", keyword_length = 2, priority = 20 },
				{ name = "nvim_lsp", keyword_length = 2, priority = 10 },
				-- { name = "copilot" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lua", priority = 10 },
				{ name = "buffer", keyword_length = 3, priority = 0 },
				{ name = "spell" },
				{ name = "path" },
				-- {
				--     name = "nvim_treesitter",
				--     option = {},
				--     keyword_length = 3,
				--     keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\%(\.\w*\)*\)]],
				--     trigger_characters = {},
				--     priority = 10,
				--     max_item_count = 10,
				--     group_index = 0,
				-- }
			},
			-- view =
			experimental = { ghost_text = false },
		})

		-- Use buffer source for `/`.
		cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })

		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
