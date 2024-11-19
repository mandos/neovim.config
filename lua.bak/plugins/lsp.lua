vim.lsp.set_log_level("error")
-- vim.lsp.set_log_level("debug")

local autogrup = vim.api.nvim_create_augroup("Config-LSP", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
    group = autogrup,
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        vim.keymap.set({ "i" }, "<C-n>", "<cmd>lua require('cmp').complete()<cr>", { buffer = true })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true })
        vim.keymap.set("n", "gvd", function()
            vim.cmd("vsplit")
            vim.lsp.buf.definition()
            vim.api.nvim_feedkeys("zz", "m", true)
        end, { buffer = true })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = true, desc = "Lsp type definition" })

        -- <leader> c
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "Lsp code action" })
        vim.keymap.set("n", "<leader>cf", function()
            if vim.g._priv_autoformat then
                vim.lsp.buf.format()
            end
        end, { buffer = true, desc = "Format code" })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = true, desc = "Rename" })
        vim.keymap.set("n", "<leader>cR", vim.lsp.buf.references, { buffer = true, desc = "Lsp references" })

        -- <leader> f
        vim.keymap.set("n", "<leader>fla", vim.lsp.buf.add_workspace_folder, { buffer = true, desc = "Add workspace" })
        vim.keymap.set(
            "n",
            "<leader>flr",
            vim.lsp.buf.remove_workspace_folder,
            { buffer = true, desc = "Remove workspace" }
        )
        -- TODO: mapping for lis doesn't work
        vim.keymap.set("n", "<leader>fll", function()
            vim.pretty_print(vim.inspect(vim.lsp.buf.list_workspace_folders))
        end, { buffer = true, desc = "Workspace Folders" })

        -- <leader> l
        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { buffer = true, desc = "Restart" })
        vim.keymap.set("n", "<leader>lS", "<cmd>LspStop<cr>", { buffer = true, desc = "Stop" })
    end,
})

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "lspcontainers/lspcontainers.nvim",
        "onsails/lspkind-nvim",
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    },
    config = function()
        local default_config = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            flags = { debounce_text_changes = 150 },
        }

        local lspconfig_path = vim.fs.dirname(debug.getinfo(1).short_src) .. "/../core/lsp"

        for server in vim.fs.dir(lspconfig_path) do
            local lsp_name = string.gsub(server, ".lua", "")
            local custom_config = require("core.lsp." .. lsp_name)
            if custom_config.enabled == true or custom_config.enabled == nil then
                custom_config = vim.tbl_deep_extend("force", default_config, custom_config)
                require("lspconfig")[lsp_name].setup(custom_config)
            end
            -- custom_config = vim.tbl_deep_extend("force", default_config, custom_config)
            -- lspconfig[lsp_name].setup(custom_config)
        end
    end,
}

-- require("lsp_signature").setup({
--     bind = true, -- This is mandatory, otherwise border config won't get registered.
--     floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
--     doc_lines = 2, -- Set to 0 for not showing doc
--     hint_prefix = "🐼 ",
--     -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
--     handler_opts = {
--         border = "shadow", -- double, single, shadow, none
--     },
-- })
-- end
