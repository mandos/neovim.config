local keymap = vim.keymap
vim.opt.commentstring = "// %s"

vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

function tc(string)
    return vim.api.nvim_replace_termcodes(string, true, false, true)
end

keymap.set("i", "<C-CR>", function()
    local last = vim.fn.getline("."):sub( -1)
    if last ~= ";" and last ~= "{" and last ~= "" and last ~= "}" then
        vim.fn.feedkeys(tc("<Esc>A;<CR>"))
    else
        vim.fn.feedkeys(tc("<Esc>o"))
    end
end, { buffer = 0 })

keymap.set("i", "<C-a>", function()
    local last = vim.fn.getline("."):sub( -1)
    if last ~= ";" and last ~= "{" and last ~= "" and last ~= "}" then
        vim.fn.feedkeys(tc("<Esc>A;"))
    else
        vim.fn.feedkeys(tc("<Esc>A"))
    end
end, { buffer = 0 })

keymap.set("i", "$$", "$this->", { buffer = 0 })
