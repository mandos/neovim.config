return {
	"rgroli/other.nvim",
	cmd = { "Other", "OtherClear", "OtherSplit", "OtherVSplit", "OtherTabNew" },

	config = function()
		require("other-nvim").setup({
			-- by default there are no mappings enabled
			mappings = {
				{
					pattern = "lua/(.*).lua",
					target = "dupas/%1_spec.lua",
					context = "test",
				},
				{
					pattern = "tests/(.*)_spec.lua",
					target = "lua/%1.lua",
					context = "implementation",
				},
				{
					pattern = "staging/(.*)",
					target = "production/%1",
					context = "production",
				},
				{
					pattern = "production/(.*)",
					target = "staging/%1",
					context = "staging",
				},
			},
			-- default transformers
			-- transformers = {
			--     camelToKebap = transformers.camelToKebap,
			--     kebapToCamel = transformers.kebapToCamel,
			--     pluralize = transformers.pluralize,
			--     singularize = transformers.singularize,
			-- },

			-- Should the window show files which do not exist yet based on
			-- pattern matching. Selecting the files will create the file.
			showMissingFiles = true,
			-- When a mapping requires an initial selection of the other file, this setting controls,
			-- wether the selection should be remembered for the current user session.
			-- When this option is set to false reference between the two buffers are never saved.
			-- Existing references can be removed on the buffer with :OtherClear
			rememberBuffers = true,
			keybindings = {
				["<cr>"] = "open_file()",
				["<esc>"] = "close_window()",
				o = "open_file()",
				q = "close_window()",
				v = "open_file_vs()",
				s = "open_file_sp()",
			},
			hooks = {
				-- This hook which is executed when the file-picker is shown.
				-- It could be used to filter or reorder the files in the filepicker.
				-- The function must return a lua table with the same structure as the input parameter.
				--
				-- The input parameter "files" is a lua table with each entry containing:
				-- @param table (filename (string), context (string), exists (boolean))
				-- @return table
				filePickerBeforeShow = function(files)
					return files
				end,

				-- This hook is called whenever a file is about to be opened.
				-- One example how this can be used: a non existing file needs to be opened by another plugin, which provides a template.
				--
				-- @param filename (string) the full-path of the file
				-- @param exists (boolean) doess the file already exist
				-- @return (boolean) When true (default) the plugin takes care of opening the file, when the function returns false this indicated that opening of the file is done in the hook.
				onOpenFile = function(filename, exists)
					return true
				end,
			},
			style = {
				-- How the plugin paints its window borders
				-- Allowed values are none, single, double, rounded, solid and shadow
				border = "solid",

				-- Column seperator for the window
				seperator = "|",

				-- Indicator showing that the file does not yet exist
				newFileIndicator = "(* new *)",

				-- width of the window in percent. e.g. 0.5 is 50%, 1 is 100%
				width = 0.7,

				-- min height in rows.
				-- when more columns are needed this value is extended automatically
				minHeight = 2,
			},
		})
	end,
}
