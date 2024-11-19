return {
	enabled = vim.fn.executable("nil") == 1,
	["nil"] = {
		formatting = {
			command = "nixpkgs-fmt",
		},
		diagnostics = {
			ignored = {},
			excludedFiles = {},
		},
		nix = {
			binary = "nix",
			maxMemoryMB = 2560,
			flake = {
				autoArchive = null,
				autoEvalInputs = false,
				nixpkgsInputName = "nixpkgs",
			},
		},
	},
}
