-- options are loaded in lazy
-- require("core.options")
--
vim.filetype.add({
	extension = {
		gotmpl = "gotmpl",
	},
	pattern = {
		[".*/templates/.*%.tpl"] = "helm",
		[".*/templates/.*%.ya?ml"] = "helm",
		["helmfile.*%.ya?ml"] = "helm",
	},
})
require("core.lazy")
require("core.autocmds")
require("core.keymaps")
require("languages.rust")
