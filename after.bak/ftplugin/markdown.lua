vim.opt_local.spell = true
vim.opt_local.wrap = true

-- match and highlight hyperlinks
vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
vim.cmd("hi matchURL guifg=DodgerBlue")
vim.diagnostic.config({ virtual_lines = false })
