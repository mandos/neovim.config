local au_everywhere = vim.api.nvim_create_augroup("mine_everywhere", { clear = true })

-- Remove all trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	command = ":%s/\\s\\+$//e",
	group = au_everywhere,
})
-- Prevent new line to also start with a comment
vim.api.nvim_create_autocmd("FileType", {
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	group = au_everywhere,
})
-- Highlight yanked text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = au_everywhere,
})

local au_text = vim.api.nvim_create_augroup("mine_text", { clear = true })
-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md", "*.tex" },
	command = "setlocal spell",
	group = au_text,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "lspinfo", "null-ls-info" },
	command = "nnoremap <buffer><silent> q :close<cr>",
})

-- local au_formatter = vim.api.nvim_create_augroup("mine_formatter", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	callback = function()
-- 		if vim.g._priv_autoformat then
-- 			vim.cmd("FormatWrite")
-- 		end
-- 	end,
-- 	group = au_formatter,
-- })

-- TODO: Check if this can be do better
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = { "FormatterPost" },
-- 	command = "e %",
-- 	group = au_formatter,
-- })
