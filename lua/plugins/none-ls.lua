return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls").builtins
    -- 	local h = require("null-ls.helpers")
    -- 	local FORMATING = require("null-ls.methods").internal.FORMATTING
    -- 	local config = require("core.utils").config()
    --
    -- 	-- local my_config = require("core.utils").load_config()
    --
    -- 	local check_runtime = function(app, action)
    -- 		return function(utils)
    -- 			if vim.fn.executable(app) == 1 then
    -- 				return true
    -- 			else
    -- 				vim.notify_once(
    -- 					"Can't perform " .. action .. ", '" .. app .. "' is not installed",
    -- 					vim.log.levels.ERROR,
    -- 					{ title = "Null Language Server configuration" }
    -- 				)
    -- 				return false
    -- 			end
    -- 		end
    -- 	end
    --
    -- 	-- HCL formatter
    -- 	local terragrunt_formatting = h.make_builtin({
    -- 		name = "terragrunt",
    -- 		method = FORMATING,
    -- 		filetypes = { "hcl", "terraform" },
    -- 		generator_opts = {
    -- 			command = "terragrunt",
    -- 			args = {
    -- 				"hclfmt",
    -- 				"--terragrunt-hclfmt-file",
    -- 				"$FILENAME",
    -- 			},
    -- 			to_temp_file = true,
    -- 		},
    -- 		factory = h.formatter_factory,
    -- 	})
    --
    -- 	require("null-ls").setup({
    -- 		-- cmd = { "nvim" },
    -- 		-- debounce = 250,
    -- 		-- debug = false,
    -- 		default_timeout = 5000,
    -- 		-- diagnostics_format = "#{m}",
    -- 		-- log = {
    -- 		--     enable = true,
    -- 		--     level = "warn",
    -- 		--     use_console = "async",
    -- 		-- },
    -- 		-- on_attach = nil,
    -- 		-- on_init = nil,
    -- 		-- on_exit = nil,
    -- 		-- root_dir = u.root_pattern(".null-ls-root", "Makefile", ".git"),
    -- 		-- update_in_insert = false,
    -- 		--
    -- 		sources = {
    -- 			-- null_ls.code_actions.eslint,
    -- 			-- null_ls.diagnostics.eslint,
    -- 			-- null_ls.formatting.eslint,
    --
    -- 			-- null_ls.formatting.stylua,
    -- 			-- null_ls.formatting.prettier.with({
    -- 			--     extra_args = { "--single-quote", "false" },
    -- 			-- }),
    -- 			-- Lua
    -- 			null_ls.formatting.stylua.with({
    -- 				runtime_conditional = check_runtime("stylua", "formatting"),
    -- 			}),
    --
    -- 			-- Python
    -- 			null_ls.formatting.black.with({
    -- 				runtime_condition = check_runtime("black", "formatting"),
    -- 			}),
    --
    -- 			-- Nix
    -- 			null_ls.formatting.nixpkgs_fmt.with({
    -- 				runtime_condition = check_runtime("nixpkgs-fmt", "formatting"),
    -- 			}),
    --
    -- 			-- Terraform and Terragrunt
    -- 			null_ls.formatting.terraform_fmt.with({
    -- 				runtime_condition = check_runtime("terraform", "formatting"),
    -- 			}),
    -- 			terragrunt_formatting.with({
    -- 				runtime_condition = check_runtime("terragrunt", "formatting"),
    -- 			}),
    -- 		},
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require("null-ls").setup({
      sources = {
        null_ls.formatting.stylua,
      },

      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              -- vim.lsp.buf.formatting_sync()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
    -- 		on_attach = function(client, bufnr)
    -- 			-- local lsp_formating = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    -- 			if client.supports_method("textDocument/formatting") then
    -- 				local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    -- 				vim.api.nvim_create_autocmd("BufWritePre", {
    -- 					group = augroup,
    -- 					buffer = bufnr,
    -- 					callback = function()
    -- 						if config.get("autoformat") then
    -- 							vim.lsp.buf.format()
    -- 						end
    -- 					end,
    -- 				})
    -- 			end
    -- 		end,
    -- 	})
  end,
}
