return {
	-- enabled = vim.fn.executable("ltex-ls") == 1,
	enabled = false,
	settings = {
		ltex = {
			dictionary = {
				-- ["en-US"] = { ":/tmp/externalFile.txt" },
			},
		},
	},
}
