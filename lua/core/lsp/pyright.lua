return {
	cmd = require("lspcontainers").command("pyright", {
		image = "mandos22/ls-python:3.10",
	}),
	before_init = function(params)
		params.processId = vim.NIL
	end,
	--    ,{
	-- 	"nix-shell",
	-- 	"--packages",
	-- 	"nodePackages.pyright",
	-- 	"--command",
	-- 	'"pyright-langserver --stdio"',
	-- },
}
