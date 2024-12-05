return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- "lspcontainers/lspcontainers.nvim",
		-- "onsails/lspkind-nvim",
		-- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>hl", "<cmd>LspInfo<cr>")
		-- require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		local serwers = { "lua_ls" }
		for _, server in ipairs(serwers) do
			local file = "./lsp'/" .. server .. ".lua"
			-- local var_dump = require("core.utils").var_dump
			-- var_dump(file)
			-- if vim.uv.fs_stat("./configs/" .. server .. ".lua") then
			if vim.fs.find(server .. ".lua", { path = "./configs", type = "file" }) then
				-- var_dump(require("plugins.lsp.configs." .. server))
				require("lspconfig")[server].setup(require("plugins.lsp." .. server))
			-- require("lspconfig")[server].setup({})
			else
				require("lspconfig")[server].setup({})
			end
		end
	end,
}
