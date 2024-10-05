vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { ".tridactylrc", "tridactylrc" },
	command = "set filetype=tridactyl",
})
