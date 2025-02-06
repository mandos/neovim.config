return {
	enabled = true,
	"ggandor/lightspeed.nvim",
	config = function()
		require("lightspeed").setup({
			ignore_cases = true,
		})
	end,
}
