-- Keybindings
-- vim.keymap.set({ "n" }, "<leader>aa", "<cmd>NeoAI<cr>", { desc = "open NeoAI" })
-- vim.keymap.set({ "n", "v" }, "<leader>ax", "<cmd>NeoAIContext<cr>", { desc = "open NeoAI context" })

-- vim.keymap.set({ "n", "v" }, "<leader>ai", "NeoAIInjectCode ", { desc = "inject code" })
-- vim.keymap.set({ "n", "v" }, "<leader>ac", "NeoAIInjectContextCode ", { desc = "inject code with context" })

--- function to inject code from comment and run it with <leader>ap
vim.treesitter.language.register("markdown", "neoai-output")

return {
	"Bryley/neoai.nvim",
	enable = false,
	dev = true,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	cmd = {
		"NeoAI",
		-- "NeoAIOpen",
		-- "NeoAIClose",
		-- "NeoAIToggle",
		-- "NeoAIContext",
		-- "NeoAIContextOpen",
		-- "NeoAIContextClose",
		-- "NeoAIInject",
		-- "NeoAIInjectCode",
		-- "NeoAIInjectContext",
		-- "NeoAIInjectContextCode",
	},
	keys = {
		{ "<leader>as", desc = "summarize text" },
		{ "<leader>ag", desc = "generate git message" },
	},
	config = function()
		require("neoai").setup({
			-- Below are the default options, feel free to override what you would like changed
			ui = {
				output_popup_text = "NeoAI",
				input_popup_text = "Prompt",
				width = 30, -- As percentage eg. 30%
				output_popup_height = 80, -- As percentage eg. 80%
				submit = "<Enter>", -- Key binding to submit the prompt
			},

			diagnostic = {
				notification_level = vim.log.levels.DEBUG,
				log_level = vim.log.levels.TRACE,
				log_path = vim.fn.stdpath("log") .. "/neoai.log",
				log_use_file = false,
				log_use_console = true,
			},
			models = {
				{
					name = "openai",
					model = "gpt-3.5-turbo",
					params = nil,
				},
			},
			register_output = {
				["g"] = function(output)
					return output
				end,
				["c"] = require("neoai.utils").extract_code_snippets,
			},
			inject = {
				cutoff_width = nil,
			},
			prompts = {
				context_prompt = function(context)
					return "Hey, I'd like to provide some context for future "
						.. "messages. Here is the code/text that I want to refer "
						.. "to in our upcoming conversations:\n\n"
						.. context
				end,
			},
			mappings = {
				["select_up"] = "<C-k>",
				["select_down"] = "<C-j>",
			},
			open_ai = {
				api_key = {
					get = function()
						local key = vim.fn.system("pass show sites/openai/mytestkey")
						key = string.gsub(key, "\n", "")
						return key
					end,
				},
			},
			shortcuts = {
				{
					name = "textify",
					key = "<leader>as",
					desc = "fix text with AI",
					use_context = true,
					prompt = [[
                        Please rewrite the text to make it more readable, clear,
                        concise, and fix any grammatical, punctuation, or spelling
                        errors
                    ]],
					modes = { "v" },
					strip_function = nil,
				},
				{
					name = "code",
					key = "<leader>am",
					desc = "generate code from comment",
					use_context = true,
					prompt = [[
                        Please use the following comment to generate code:
                        ...
                        Language is set to ...
                    ]],
					modes = { "v" },
					strip_function = nil,
				},
				{
					name = "gitcommit",
					key = "<leader>ag",
					desc = "generate git commit message",
					use_context = false,
					prompt = function()
						return [[
                            Using the following git diff generate a consise and
                            clear git commit message, with a short title summary
                            that is 75 characters or less:
                        ]] .. vim.fn.system("git diff --cached")
					end,
					modes = { "n" },
					strip_function = nil,
				},
			},
		})
	end,
}
