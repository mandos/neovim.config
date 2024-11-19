-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local get_config = function(name)
	return function()
		require("config/" .. name)
	end
end

return {
	{
		"folke/which-key.nvim",
		config = get_config("which-key"),
	},

	"anuvyklack/hydra.nvim",

	-- Under development
	-- ",/workspace/vim/schmetterling.nvim"
	-- build command in container
	-- docker and docker compose wrapper
	-- ",/workspace/vim/neodocker"
	-- require("neodocker")
	-- build command in container
	-- ",/workspace/vim/doohickey.nvim"
	-- build command in container

	-- {
	-- 	dir = "/workspace/vim/nvim-helm",
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	-- 	config = get_config("helm"),
	-- },

	-- Plugins

	-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		lazy = true,
		keys = { { "n", "<leader>t" } },
		cmd = { "Trouble", "TroubleToggle" },
		config = get_config("trouble"),
	},

	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"jvgrootveld/telescope-zoxide",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},

	{ "crispgm/telescope-heading.nvim" },

	{
		"folke/todo-comments.nvim",
		lazy = true,
		dependencies = "nvim-lua/plenary.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "BufReadPost",
		config = get_config("todo"),
	},

	-- This plugin adds indentation guides to all lines (including empty lines).

	-- Color syntax
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		require = { "nvim-treesitter" },
	},

	{ "p00f/nvim-ts-rainbow", require = { "nvim-treesitter" } },

	-- Plugin develoment

	-- TODO: check it later
	-- { "folke/neodev.nvim", config = get_config("neodev") },

	-- AI
	-- TODO: Check if this can be more convenient to
	-- {
	--     "zbirenbaum/copilot-cmp",
	--     after = { "copilot.lua" },
	--     config = function()
	--         require("copilot_cmp").setup()
	--     end,
	-- },

	-- Language Tools
	-- Golang
	-- {
	--     "ray-x/go.nvim",
	--     require = { "neovim/nvim-lspconfig", "ray-x/guihua.lua", "nvim-treesitter/nvim-treesitter" },
	--     config = get_config("go-nvim"),
	--     -- ft = { "go", "gomod" },
	--     build = ':lua require("go.install").update_all_sync()',
	--     -- lazy = true
	-- },

	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- NOTE: Maybe also this
	-- https://github.com/sidebar-nvim/sections-dap

	-- Project management
	{ "tpope/vim-projectionist" },

	-- Git plugins
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- event = "BufReadPre",
		config = get_config("gitsigns"),
	},

	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		cmd = "Octo",
		keys = { { "n", "<leader>o" } },
		config = get_config("octo"),
	},
}
