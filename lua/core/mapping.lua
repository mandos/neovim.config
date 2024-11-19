-- local map = vim.api.nvim_set_keymap
-- default_options = { noremap = true, silent = true }
-- expr_options = { noremap = true, expr = true, silent = true }
--
-- vim.g.mapleader = " "
--
-- -- better indenting
-- map("v", "<", "<gv", default_options)
-- map("v", ">", ">gv", default_options)
--
-- -- paste over currently selected text without yanking it
-- map("v", "p", '"_dP', default_options)
--
-- -- Cancel search highlighting with ESC
-- map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)
--
-- -- Resizing panes
-- map("n", "<Left>", ":vertical resize +1<CR>", default_options)
-- map("n", "<Right>", ":vertical resize -1<CR>", default_options)
-- map("n", "<Up>", ":resize -1<CR>", default_options)
-- map("n", "<Down>", ":resize +1<CR>", default_options)
--
-- -- Autocorrect spelling from previous error
-- map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)
--
-- -- Move selected line / block of text in visual mode
-- map("x", "K", ":move '<-2<CR>gv-gv", default_options)
-- map("x", "J", ":move '>+1<CR>gv-gv", default_options)

vim.keymap.set({"n", "c"}, "xx", "<cmd>confirm quitall<cr>" )
vim.keymap.set("n", "<tab>", "<cmd>Telescope buffers<cr>")

vim.keymap.set("n", "<leader>ol", "<cmd>Lazy<cr>")

vim.keymap.set("n", "<leader>hh", "<cmd>Telescope help_tags<cr>")

vim.keymap.set("n", "<leader>ts", "<cmd>set list!<cr>")

-- Windows
for i = 1, 6 do
	vim.keymap.set("n", "<leader>" .. i, i .. "<c-w>w", { desc = "Move to Window " .. i })
	vim.keymap.set("n", "<leader>w" .. i, "<cmd>" .. i .. "hide<cr>", { desc = "Close Window " .. i })
end

vim.keymap.set("n", "<leader>ww", "<c-w><c-w>", {})
vim.keymap.set("n", "<leader>w\\", "<cmd>vsplit<cr>", {})
vim.keymap.set("n", "<leader>w-", "<cmd>split<cr>", {})
vim.keymap.set("n", "<leader>w=", "<c-w>=", {})
vim.keymap.set("n", "<leader>wd", "<cmd>:q<cr>", {})
