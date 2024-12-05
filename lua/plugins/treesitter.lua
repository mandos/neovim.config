return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "hcl",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "terraform",
        "vim",
        "vimdoc",
        "query",
        "yaml",
      },
    })
  end,
}
