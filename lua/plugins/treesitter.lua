return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()

        local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
        parser_config.gotmpl = {
          install_info = {
            url = "https://github.com/ngalaiko/tree-sitter-go-template",
            files = {"src/parser.c"}
          },
          filetype = "gotmpl",
          used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
        }

        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",
            --
            ignore_install = {}, -- List of parsers to ignore installing
            parsers = {
                ["neoai-output"] = "markdown",
            },
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = {}, -- list of language that will be disabled
                additional_vim_regex_highlighing = false,
            },
            incremental_selection = { enable = true },
            indent = {
                enable = true,
                disable = { "yaml" },
            },
            autopairs = { enable = true },
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ib"] = "@block.inner",
                        ["ab"] = "@block.outer",
                        ["ir"] = "@parameter.inner",
                        ["ar"] = "@parameter.outer",
                    },
                },
            },
            rainbow = {
                enable = true,
                extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                max_file_lines = 2000, -- Do not enable for files with more than specified lines
            },
            -- playground = {
            --     enable = true,
            --     disable = {},
            --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            --     persist_queries = false, -- Whether the query persists across vim sessions
            --     keybindings = {
            --         toggle_query_editor = "o",
            --         toggle_hl_groups = "i",
            --         toggle_injected_languages = "t",
            --         toggle_anonymous_nodes = "a",
            --         toggle_language_display = "I",
            --         focus_language = "f",
            --         unfocus_language = "F",
            --         update = "R",
            --         goto_node = "<cr>",
            --         show_help = "?",
            --     },
            -- },
        })
    end,
}
