vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "mysqlsh.edit.*" },
	command = "set filetype=sql",
})
