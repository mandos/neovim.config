return {
	cmd = { "lua-language-server", "--logpath", "/tmp" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			completion = { enable = true, callSnippet = "Both" },
			diagnostics = {
				enable = true,
				globals = { "vim", "describe", "it", "setup", "teardown", "before_each", "after_each" },
				disable = { "lowercase-global" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					vim.api.nvim_get_runtime_file("", true),
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				-- adjust these two values if your performance is not optimal
				maxPreload = 2000,
				preloadFileSize = 1000,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
}
