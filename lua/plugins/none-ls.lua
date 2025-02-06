return {
	"nvimtools/none-ls.nvim",
	enabled = true,
	config = function()
		local null_ls = require("null-ls").builtins
		-- TODO: If everything for formating in lsp is working then remove dead code from here
		-- Autocommands are created in lsp module
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		require("null-ls").setup({
			sources = {
				null_ls.formatting.nixfmt,
				null_ls.formatting.shfmt,
				null_ls.formatting.stylua,
			},

			-- you can reuse a shared lspconfig on_attach callback here
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				local formatter = require("core.utils").formatter
			-- 				if formatter:is_on() then
			-- 					vim.lsp.buf.format({ async = false })
			-- 				end
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
}
