return {
	enabled = vim.fn.executable("gopls") == 1,
	-- --  TODO:: Not sure but I think this is not working
	-- analyses = { unusedparams = false },
	-- staticcheck = true,
}
