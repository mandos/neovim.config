return {
    "zbirenbaum/copilot.lua",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = false,
                    accept_word = "<M-n>",
                    accept_line = "<M-h>",
                    next = "<M-o>",
                    prev = "<M-S-o>",
                    dismiss = false,
                },
            },
            filetypes = {
                yaml = true,
                markdown = false,
                help = false,
                gitcommit = true,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            copilot_node_command = vim.g.mine_copilot_node_command,
            server_opts_overrides = {},
        })
    end,
}
