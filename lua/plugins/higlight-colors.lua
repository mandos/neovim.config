return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			custom_colors = {
				{ label = "@munch%-base00", color = "#282828" },
				{ label = "@munch%-base01", color = "#3c3836" },
				{ label = "@munch%-base02", color = "#504945" },
				{ label = "@munch%-base03", color = "#665c54" },
				{ label = "@munch%-base04", color = "#bdae93" },
				{ label = "@munch%-base05", color = "#d5c4a1" },
				{ label = "@munch%-base06", color = "#ebdbb2" },
				{ label = "@munch%-base07", color = "#fbf1c7" },
				{ label = "@munch%-base08", color = "#fb4934" },
				{ label = "@munch%-base09", color = "#fe8019" },
				{ label = "@munch%-base0A", color = "#fabd2f" },
				{ label = "@munch%-base0B", color = "#b8bb26" },
				{ label = "@munch%-base0C", color = "#8ec07c" },
				{ label = "@munch%-base0D", color = "#83a598" },
				{ label = "@munch%-base0E", color = "#d3869b" },
				{ label = "@munch%-base0F", color = "#d65d0e" },
			},
		})
	end,
}
