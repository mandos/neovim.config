vim.api.nvim_set_keymap("n", "<leader>tm", "<cmd>MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>om", "<cmd>MarkdownPreview<CR>", { noremap = true, silent = true })

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
