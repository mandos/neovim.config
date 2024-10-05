return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- bats = { require("formatter.filetypes.sh").shfmt },
				go = { require("formatter.filetypes.go").gofmt },
				haskell = {
					function()
						return {
							exe = "ormolu",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				hcl = {
					function()
						return {
							exe = "terragrunt",
							args = {
								"hclfmt",
								"--terragrunt-hclfmt-file",
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = false,
						}
					end,
				},
				lua = { require("formatter.filetypes.lua").stylua },
				nix = {
					function()
						return {
							exe = "nixpkgs-fmt",
							args = {},
							stdin = true,
						}
					end,
				},
				python = { require("formatter.filetypes.python").black },
				sh = { require("formatter.filetypes.sh").shfmt },
				terraform = {
					require("formatter.filetypes.terraform").terraformfmt,
				},

				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
