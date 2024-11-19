vim.api.nvim_set_keymap("n", "<leader>op", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "kyazdani42/nvim-web-devicons", lazy = true },
        { "MunifTanjim/nui.nvim",         lazy = true },
    },
}
