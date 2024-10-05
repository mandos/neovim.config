local nix_run = function(package, cmd)
  return {
    "nix-shell",
    "--pure",
    "--packages",
    package,
    "--run",
    "\"" .. cmd .. "\"",
}
end

return {
    "elentok/format-on-save.nvim",
    config = function()
        local format_on_save = require("format-on-save")
        local formatters = require("format-on-save.formatters")

        format_on_save.setup({
          exclude_path_patterns = {
            "/.git/",
            ".local/share/nvim/lazy",
            "/node_modules/",
            "/vendor/",
          },
          formatter_by_ft = {
            -- hcl = formatters.shell({"nix-shell", "--pure", "--packages", "terragrunt", "--run", "\"terragrunt hclfmt\""}),
            -- terraform =
            -- css = formatters.lsp,
            -- html = formatters.lsp,
            -- java = formatters.lsp,
            -- javascript = formatters.lsp,
            -- json = formatters.lsp,
            -- lua = formatters.lsp,
            -- markdown = formatters.prettierd,
            -- openscad = formatters.lsp,
            -- python = formatters.black,
            -- rust = formatters.lsp,
            -- scad = formatters.lsp,
            -- scss = formatters.lsp,
            -- sh = formatters.shfmt,
            -- terraform = formatters.lsp,
            -- typescript = formatters.prettierd,
            -- typescriptreact = formatters.prettierd,
            -- yaml = formatters.lsp,

            -- Add your own shell formatters:
            -- myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

            -- Add lazy formatter that will only run when formatting:
            -- my_custom_formatter = function()
            --   if vim.api.nvim_buf_get_name(0):match("/README.md$") then
            --     return formatters.prettierd
            --   else
            --     return formatters.lsp()
            --   end
            -- end,

            -- Add custom formatter
            -- filetype1 = formatters.remove_trailing_whitespace,
            -- filetype2 = formatters.custom({ format = function(lines)
            --   return vim.tbl_map(function(line)
            --     return line:gsub("true", "false")
            --   end, lines)
            -- end}),

            -- Concatenate formatters
            -- python = {
            --   formatters.remove_trailing_whitespace,
            --   formatters.shell({ cmd = "tidy-imports" }),
            --   formatters.black,
            -- },

            -- Use a tempfile instead of stdin
          --   go = {
          --     formatters.shell({
          --       cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
          --       tempfile = function()
          --         return vim.fn.expand("%") .. '.formatter-temp'
          --       end
          --     }),
          --     formatters.shell({ cmd = { "gofmt" } }),
          --   },
          },

          -- Optional: fallback formatter to use when no formatters match the current filetype
          fallback_formatter = {
            formatters.remove_trailing_whitespace,
          },

          -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
          -- To prevent that set `run_with_sh` to `false`.
          run_with_sh = false,
        })
    end
}
