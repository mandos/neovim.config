vim.api.nvim_create_autocmd({ "BufNew", "BufEnter" }, {
	pattern = "*.rs",
	desc = "Set Rust specific settings",
	group = vim.api.nvim_create_augroup("mine-rust-settings", { clear = true }),
	callback = function()
		vim.keymap.set("i", "<C-cr>", "<esc>A;<cr>", { buffer = true })
		vim.keymap.set("n", "<C-cr>", "A;<Esc>", { buffer = true })
		vim.keymap.set("i", "<C-o>", "<Esc>o", { buffer = true })
	end,
})
