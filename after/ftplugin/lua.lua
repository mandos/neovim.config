vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

require("which-key").register({
    c = {
        e = { "<cmd>source %<cr>", "Evaluate buffer" },
    },
}, { prefix = "<leader>", mode = "n", { silent = true } })
