local dap = require("dap")

require("dap.ext.vscode").load_launchjs()

-- Debugger
vim.keymap.set("n", "<M-n>", ":lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<M-N>", ":lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<M-p>", ":lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<Leader>md", ":lua require'dapui'.toggle()<cr>")
-- vim.keymap("n", "<Leader>al", "v:lua.require'dap'.run_last()")
vim.keymap.set("n", "<M-b>", ":lua require'dap'.toggle_breakpoint()<cr>")
-- vim.keymap("n", "<F5>", ":lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<Leader>mr", ":lua require'dap'.repl.open()<cr>")
-- vim.keymap("n", "<Leader>ar", "v:lua.require'dap'.run_last()")

require("dap-python").setup()

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { "/workspace/php/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Xdebug",
		port = 9003,
		stopOnEntry = true,
		serverSourceRoot = "/srv/",
		localSourceRoot = "/workspace/cobiro/scout.services/",
	},
}

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		-- host = function()
		--     local value = vim.fn.input('Host [127.0.0.1]: ')
		--     if value ~= "" then return value end
		--     return '127.0.0.1'
		-- end,
		-- port = function()
		--     local val = tonumber(vim.fn.input('Port: '))
		--     assert(val, "Please provide a port number")
		--     return val
		-- end
	},
}

dap.adapters.nlua = function(callback, config)
	-- callback({type = 'server', host = config.host, port = config.port})
	callback({ type = "server", host = "127.0.0.1", port = config.port or 8088 })
end

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				"scopes",
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 10,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = { close = { "q", "<Esc>" } },
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	filter_references_pattern = "<module", -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
	-- experimental features:
	virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})
