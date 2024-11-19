local config = require("core.utils").config()

vim.api.nvim_create_user_command("AutoformatToggle", function()
	config.toogle("autoformat")
end, {})

-- Custom terminals
local Terminal = require("toggleterm.terminal").Terminal
