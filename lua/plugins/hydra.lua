return {
	"nvimtools/hydra.nvim",
	enabled = false,
	config = function()
		local Hydra = require("hydra")
		Hydra({
			-- string? only used in auto-generated hint
			name = "Hydra's name",

			mode = { "n", "v" },

			-- string? key required to activate the hydra, when excluded, you can use
			-- Hydra:activate()
			body = "gnn",

			-- these are explained below
			hint = [[ Treesitter objects ]],
			config = {
				-- color = "amaranth",
				invoke_on_body = true,
			},
			heads = {
				{ "n", "grn" },
			},
		})

		Hydra({
			name = "Side scroll",
			mode = "n",
			body = "z",
			heads = {
				{ "h", "5zh" },
				{ "l", "5zl", { desc = "←/→" } },
				{ "H", "zH" },
				{ "L", "zL", { desc = "half screen ←/→" } },
			},
		})
	end,
}
