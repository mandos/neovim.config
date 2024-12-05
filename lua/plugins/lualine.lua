return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
	config = function()
		local function window()
			return vim.api.nvim_win_get_number(0)
		end
		--
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "nightfox",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "b:gitsigns_head", icon = "" }, "diff" },
				lualine_c = {},
				lualine_x = {
					{ "diagnostics", sources = { "nvim_diagnostic" } },
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location", window },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {
				lualine_b = {
					{
						"filename",
						file_status = true,
						path = 1, -- show relativ path
						shorting_target = 40,
						symbols = { modified = "[]", readonly = " " },
					},
				},
				lualine_z = { window },
			},
			inactive_winbar = {
				lualine_b = { "filename" },
				lualine_z = { window },
			},
			extensions = { "nvim-tree", "toggleterm", "quickfix", "symbols-outline" },
		})
	end,
}
