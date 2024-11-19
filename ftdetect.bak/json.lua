vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "composer.lock", "flake.lock" },
	command = "set filetype=json",
})
