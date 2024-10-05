vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- local au_golang = vim.api.nvim_create_augroup("my_golang", {})
-- local events = { "BufNewFile", "BufRead" }
--
-- vim.api.nvim_create_autocmd(events, {
--     group = au_golang,
--     pattern = { "*.go" },
--     callback = function()
--         vim.api.nvim_buf_set_keymap(0, "i", ":", ":= ", {})
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWriteCmd", {
--     group = au_golang,
--     pattern = { "*.go" },
--     callback = function()
--         vim.api.nvim_cmd({ cmd = "GoFmt" }, {})
--     end,
-- })
