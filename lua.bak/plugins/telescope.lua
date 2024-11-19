return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	module = "telescope",
	dependencies = {
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		-- local custom_actions = {}
		local telescope = require("telescope")
		local z_utils = require("telescope._extensions.zoxide.utils")
		-- local trouble = require("trouble.providers.telescope")

		-- telescope.load_extension("projects")

		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local transform_mod = require("telescope.actions.mt").transform_mod

		-- local function multiopen(prompt_bufnr, method)
		--     local cmd_map = {
		--         vertical = "vsplit",
		--         horizontal = "split",
		--         tab = "tabe",
		--         default = "edit",
		--     }
		--     local picker = action_state.get_current_picker(prompt_bufnr)
		--     local multi_selection = picker:get_multi_selection()
		--
		--     if #multi_selection > 1 then
		--         require("telescope.pickers").on_close_prompt(prompt_bufnr)
		--         pcall(vim.api.nvim_set_current_win, picker.original_win_id)
		--
		--         for i, entry in ipairs(multi_selection) do
		--             -- opinionated use-case
		--             local cmd = i == 1 and "edit" or cmd_map[method]
		--             vim.cmd(string.format("%s %s", cmd, entry.value))
		--         end
		--     else
		--         actions["select_" .. method](prompt_bufnr)
		--     end
		-- end
		--
		-- local custom_actions = transform_mod({
		--     multi_selection_open_vertical = function(prompt_bufnr)
		--         multiopen(prompt_bufnr, "vertical")
		--     end,
		--     multi_selection_open_horizontal = function(prompt_bufnr)
		--         multiopen(prompt_bufnr, "horizontal")
		--     end,
		--     multi_selection_open_tab = function(prompt_bufnr)
		--         multiopen(prompt_bufnr, "tab")
		--     end,
		--     multi_selection_open = function(prompt_bufnr)
		--         multiopen(prompt_bufnr, "default")
		--     end,
		-- })
		--
		-- local function stopinsert(callback)
		--     return function(prompt_bufnr)
		--         vim.cmd.stopinsert()
		--         vim.schedule(function()
		--             callback(prompt_bufnr)
		--         end)
		--     end
		-- end

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					-- "%.jpg",
					-- "%.png",
					-- "node_modules",
					-- ".terraform",
					-- ".terragrunt-cache",
					-- "venv",
					-- ".tests",
					-- ".git",
				},
				vimgrep_arguments = {
					"rg",
					"--follow",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--hidden",
					"--column",
					"--smart-case",
				},
				mappings = {
					-- i = {
					-- 	-- Close on first esc instead of gonig to normal mode
					-- 	["<esc>"] = actions.close,
					-- 	["<A-q>"] = actions.send_selected_to_qflist,
					-- 	["<C-q>"] = actions.send_to_qflist,
					-- 	["<tab>"] = actions.toggle_selection + actions.move_selection_next,
					-- 	["<S-tab>"] = actions.toggle_selection,
					-- 	-- ["<c-t>"] = trouble.open_with_trouble
					-- 	["<C-v>"] = stopinsert(custom_actions.multi_selection_open_vertical),
					-- 	["<C-s>"] = stopinsert(custom_actions.multi_selection_open_horizontal),
					-- 	["<C-t>"] = stopinsert(custom_actions.multi_selection_open_tab),
					-- 	["<CR>"] = stopinsert(custom_actions.multi_selection_open),
					-- },
					-- n = {
					-- 	["<tab>"] = actions.toggle_selection + actions.move_selection_next,
					-- 	["<S-tab>"] = actions.toggle_selection + actions.move_selection_previous,
					-- 	["<A-q>"] = actions.send_selected_to_qflist,
					-- 	["<C-q>"] = actions.send_to_qflist,
					-- 	-- ["<c-t>"] = trouble.open_with_trouble
					-- 	["<C-v>"] = custom_actions.multi_selection_open_vertical,
					-- 	["<C-s>"] = custom_actions.multi_selection_open_horizontal,
					-- 	["<C-t>"] = custom_actions.multi_selection_open_tab,
					-- 	["<CR>"] = custom_actions.multi_selection_open,
					-- },
				},
				-- default_mappings =
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					width = 0.75,
					prompt_position = "top",
					preview_cutoff = 120,
					horizontal = { mirror = false },
					vertical = { mirror = true },
				},
				cycle_layout_list = { "horizontal", "vertical" },
				winblend = 0,
				wrap_result = false,
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = "  ",
				multi_icon = "+",
				initial_mode = "insert",
				border = true,
				path_display = { "truncate" }, -- {"hidden", "tail", "absolute", "smart", "shorten", "truncate"}, can be function
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				hl_result_eol = true, -- heghlight for the selected items
				dynamic_preview_title = false,
				result_title = "Results",
				prompt_title = "Prompt",
				-- history =
				cache_picker = { num_pickers = 2, limit_entries = 1000 },
				-- preview =
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				color_devicons = true,
				-- file_sorter = require"telescope.sorters".get_fuzzy_file,
				-- generic_sorter = require"telescope.sorters".get_generic_fuzzy_sorter,
				-- prefilter_sorter = require("telescope.sorters").prefilter
				-- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				-- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				-- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				zoxide = {
					prompt_title = "[ Walking on the shoulders of TJ ]",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function(selection)
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd("edit " .. selection.path)
							end,
						},
						-- Opens the selected entry in a new split
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"f",
						-- "--no-ignore",
						"--hidden",
						"--exclude",
						".git",
					},
				},
				oldfiles = {
					cwd_only = true,
				},
				buffers = {
					ignore_current_buffer = true,
					sort_lastused = true,
				},
			},
		})

		-- require("telescope.builtin").git_commits({
		-- 	git_command = {
		-- 		"git",
		-- 		"log",
		-- 		"--pretty=format:'%h %ad %s [%an]",
		-- 		"--date=short",
		-- 		"--abbrev-commit",
		-- 		"--",
		-- 		".",
		-- 	},
		-- })

		telescope.load_extension("fzf")
		telescope.load_extension("heading")
		telescope.load_extension("zoxide")
		telescope.load_extension("ui-select")
		telescope.load_extension("notify")
	end,
}
