return {
    "echasnovski/mini.nvim",
    config = function()
        -- Setup similar to tpop/vim-surraound (from plugins help)
        require("mini.surround").setup({
            -- Add custom surroundings to be used on top of builtin ones. For more
            -- information with examples, see `:h MiniSurround.config`.
            custom_surroundings = nil,
            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 500,
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                add = "ys",    -- Add surrounding in Normal and Visual modes
                delete = "ds", -- Delete surrounding
                find = "<C-s>f", -- Find surrounding (to the right)
                find_left = "<C-s>F", -- Find surrounding (to the left)
                highlight = "<C-s>h", -- Highlight surrounding
                replace = "cs", -- Replace surrounding
                update_n_lines = "<C-s>n", -- Update `n_lines`

                suffix_last = "l", -- Suffix to search with "prev" method
                suffix_next = "n", -- Suffix to search with "next" method
            },
            -- Number of lines within which surrounding is searched
            n_lines = 20,
            -- Whether to respect selection type:
            -- - Place surroundings on separate lines in linewise mode.
            -- - Place surroundings on each line in blockwise mode.
            respect_selection_type = false,
            -- How to search for surrounding (first inside current line, then inside
            -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
            -- see `:h MiniSurround.config`.
            search_method = "cover_or_next",
            -- Whether to disable showing non-error feedback
            silent = false,
        })

        require("mini.pairs").setup({
            -- In which modes mappings from this `config` should be created
            modes = { insert = true, command = false, terminal = false },
            -- Global mappings. Each right hand side should be a pair information, a
            -- table with at least these fields (see more in |MiniPairs.map|):
            -- - <action> - one of "open", "close", "closeopen".
            -- - <pair> - two character string for pair to be used.
            -- By default pair is not inserted after `\`, quotes are not recognized by
            -- `<CR>`, `'` does not insert pair after a letter.
            -- Only parts of tables can be tweaked (others will use these defaults).
            mappings = {
                ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
                ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
                ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

                [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
                ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
                ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

                ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
                ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
                ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
            },
        })

        require("mini.bufremove").setup({
            -- Whether to set Vim's settings for buffers (allow hidden buffers)
            set_vim_settings = true,
        })

        require("mini.files").setup({})

        require("mini.align").setup({})
    end,
}
