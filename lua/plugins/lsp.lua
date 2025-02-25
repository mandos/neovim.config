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
		-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
		local config = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		local serwers = { "bashls", "dockerls", "helm_ls", "lua_ls", "nil_ls", "pyright", "rust_analyzer", "yamlls" }
		for _, server in ipairs(serwers) do
			local file = "./lsp'/" .. server .. ".lua"
			-- local var_dump = require("core.utils").var_dump
			-- var_dump(file)
			-- if vim.uv.fs_stat("./configs/" .. server .. ".lua") then
			if vim.tbl_isempty(vim.fs.find(server .. ".lua", { path = "./configs", type = "file" })) then
				require("lspconfig")[server].setup(config)
			else
				require("lspconfig")[server].setup(
					vim.tbl_deep_extend("error", require("plugins.lsp." .. server), config)
				)
			end
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "No lsp client")
				if client.supports_method("textDocument/formatting", { bufnr = 0 }) then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							local formatter = require("core.utils").formatter
							if formatter:is_on() then
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id, async = false })
							end
						end,
					})
				end
			end,
		})
	end,
}
