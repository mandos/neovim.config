return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls").builtins
		--
		-- local h = require("null-ls.helpers")
		-- local methods = require("null-ls.methods")
		--
		-- local FORMATTING = methods.internal.FORMATTING
		--
		local h = require("null-ls.helpers")
		local FORMATING = require("null-ls.methods").internal.FORMATTING
		local terragrunt_formatting = h.make_builtin({
			name = "terragrunt",
			method = FORMATING,
			filetypes = { "hcl" },
			generator_opts = {
				command = "terragrunt",
				args = {
					"hclfmt",
					"$FILENAME",
				},
				to_temp_file = true,
			},
			factory = h.formatter_factory,
		})

		vim.g.mm_autoformat = true

		require("null-ls").setup({
			-- cmd = { "nvim" },
			-- debounce = 250,
			-- debug = false,
			-- default_timeout = 5000,
			-- diagnostics_format = "#{m}",
			-- log = {
			--     enable = true,
			--     level = "warn",
			--     use_console = "async",
			-- },
			-- on_attach = nil,
			-- on_init = nil,
			-- on_exit = nil,
			-- root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git"),
			-- update_in_insert = false,
			--
			sources = {
				-- null_ls.code_actions.eslint,
				-- null_ls.diagnostics.eslint,
				-- null_ls.formatting.eslint,

				-- null_ls.formatting.stylua,
				-- null_ls.formatting.prettier.with({
				--     extra_args = { "--single-quote", "false" },
				-- }),
				-- null_ls.formatting.terraform_fmt,
				-- terragrunt_formatting,
				null_ls.formatting.black,
			},
			on_attach = function(client, bufnr)
				-- local lsp_formating = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
				if client.supports_method("textDocument/formatting") then
					local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							if vim.g.mm_autoformat then
								vim.lsp.buf.format()
							end
						end,
					})
				end
			end,
		})
	end,
}
