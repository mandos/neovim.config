return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			config = function()
				require("lazydev").setup({
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				})
			end,
		},
		-- "lspcontainers/lspcontainers.nvim",
		-- "onsails/lspkind-nvim",
		-- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>hl", "<cmd>LspInfo<cr>")
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
		--
		-- require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		--
		local serwers = { "bashls", "dockerls", "lua_ls", "nil_ls", "rust_analyzer" }
		for _, server in ipairs(serwers) do
			local file = "./lsp'/" .. server .. ".lua"
			-- local var_dump = require("core.utils").var_dump
			-- var_dump(file)
			-- if vim.uv.fs_stat("./configs/" .. server .. ".lua") then
			if vim.tbl_isempty(vim.fs.find(server .. ".lua", { path = "./configs", type = "file" })) then
				require("lspconfig")[server].setup({})
			else
				require("lspconfig")[server].setup(require("plugins.lsp." .. server))
			end
		end
	end,
}
