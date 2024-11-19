local keymap = vim.keymap
local wk = require("which-key")
local cmp = require("cmp")

local luasnip = require("luasnip")
local default_options = { noremap = true, silent = true }
-- register non leader based mappings

-- Windows hopping
for i = 1, 6 do
	keymap.set("n", "<Leader>" .. i, i .. "<C-w>w", { desc = "Move to Window " .. i })
	keymap.set("n", "<Leader>w" .. i, "<cmd>" .. i .. "hide<cr>", { desc = "Close Window " .. i })
end

-- Jump and center screen
keymap.set("n", "<C-d>", "<C-d>zz", {})
keymap.set("n", "<C-u>", "<C-u>zz", {})
keymap.set("n", "n", "nzz", {})
keymap.set("n", "N", "Nzz", {})
keymap.set("n", "*", "*zz", {})

-- Buffer hopping
keymap.set("n", "<tab>", ":Telescope buffers<cr>", {})

-- Alternative files
keymap.set("n", "ga", function()
	local current_win = vim.fn.winnr()
	if vim.fn.winnr("l") == current_win then
		vim.cmd("OtherVSplit")
	else
		local current_buf = vim.fn.bufnr()
		vim.cmd("wincmd l")
		vim.cmd("buffer " .. current_buf)
		vim.cmd("Other")
	end
end, { desc = "Go to alternative file in vertical split" })
keymap.set("n", "gA", "<cmd>Other<cr>", { desc = "Go to alternative file" })

-- Helpers for insert mode
keymap.set("i", "<C-l>", "<Right>", {})
keymap.set("i", "<C-a>", "<Esc>A", {})
keymap.set("i", "<C-cr>", "<Esc>o", {})

-- Jump to document symbol
keymap.set("n", "gj", "<cmd>Telescope lsp_document_symbols<cr>", {})

-- BUG: doesn't work as supposed to
function _G.ReloadConfig()
	local hls_status = vim.v.hlsearch
	for name, _ in pairs(package.loaded) do
		if name:match("^cnull") then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	if hls_status == 0 then
		vim.opt.hlsearch = false
	end
end

-- Register all leader based mappings

wk.register({
	["<Tab>"] = {
		c = { "<cmd>tabnew<cr>", "New tab" },
		d = { "<cmd>tabclose<cr>", "Remove tab" },
		["n"] = { "<cmd>tabnext<cr>", "Next tab" },
		N = { "<cmd>tabnew<cr>", "New tab" },
		["p"] = { "<cmd>tabprevious<cr>", "Previous tab" },
	},
	a = { "<Cmd>Cognite<CR>", "Cognite" },
	b = {
		name = "Buffers",
		b = {
			"<cmd>Telescope buffers<cr>",
			"Find buffer",
		},
		d = { "<cmd>lua MiniBufremove.delete()<cr>", "Remove buffer" },
		f = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
	},
	c = {
		name = "code",
		d = {
			"<cmd>Telescope diagnostics<cr>",
			"Document Diagnostics",
		},
		D = {
			"<cmd>Trouble document_diagnostics<cr>",
			"Document diagnostics",
		},
		S = { "<cmd>lua require('luasnip.loaders').edit_snippet_files()<cr>", "Edit snippets" },
	},
	f = {
		name = "Files",
		a = { "<cmd>Other<cr>", "Go to alternative file" },
		A = { "<cmd>OtherVSplit<cr>", "Go to alternative file" },
		d = { "<cmd>Telescope zoxide list<cr>", "Change dir with zoxide" },
		f = {
			"<cmd>Telescope find_files<cr>",
			"Find Files",
		},
		s = { "<cmd>w<cr>", "Save Buffer" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		p = {
			"<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim'}, prompt_title = string.format('Find Files (%s)', '~/.config/nvim')})<cr>",
			"Find configuration files",
		},
	},
	g = {
		name = "Git",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		B = { "<cmd>Git blame<cr>", "Toogle Blame" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			function()
				vim.ui.input({ prompt = "Which commit/branch you want to diff with: " }, function(input)
					require("gitsigns").diffthis(input, {})
				end)
			end,
			"Diff file",
		},
		g = { "<cmd>Git<cr>", "Git status" },
		p = { "<cmd>Git pull<cr>", "Git pull" },
		P = { "<cmd>Git push<cr>", "Git push" },
		-- s = { Name = "Gitsign" },
		S = { "<cmd>Telescope git_stash<cr>", "Stash" },
		-- t = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		t = {
			Name = "Gitsign toggle",
			{
				b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame" },
				d = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted" },
				l = { "<cmd>Gitsigns toggle_linehl<cr>", "Toggle line highting" },
				n = { "<cmd>Gitsigns toggle_numhl<cr>", "Toggle number highting" },
				s = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle signs" },
				w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Toggle words highting" },
			},
		},
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
	},
	h = {
		a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
		c = { "<cmd>checkhealth<cr>", "Check health" },
		d = {
			"<cmd>lua vim.pretty_print(require'dap'.status())<cr>",
			"Debugger status",
		},
		h = { "<cmd>Telescope help_tags<cr>", "Find help" },
		i = { "<cmd>Inspect<cr>", "Inspect element" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		l = { "<cmd>LspInfo<cr>", "LSP info" },
		m = { "<cmd>messages<cr>", "Messages" },
		M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
		n = { "<cmd>Notifications<cr>", "Notifications" },
		r = {
			name = "reload",
			c = { "<cmd>Lazy reload cognite.nvim<cr>", "Reload Copilot" },
			m = { "<cmd>Telescope reloader<cr>", "Reload module" },
			r = { "<cmd>lua ReloadConfig()<cr>", "Reload Neovim configuration" },
		},
	},
	l = {
		name = "LSP",
		d = {
			"<cmd>Trouble document_diagnostics<cr>",
			"Document diagnostics",
		},
		D = {
			"<cmd>Trouble workspace_diagnostics<cr>",
			"Workspace diagnostics",
		},
		i = { "<cmd>LspInfo<cr>", "Info" },
		l = { "<cmd>LspLog<cr>", "Logs" },
		r = { "<cmd>LspRestart<cr>", "Restart language servers" },
		R = { "<cmd>LspStart<cr>", "Start (run) language servers" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>LspStop<cr>", "Stop language servers" },
	},
	m = {
		name = "Misc",
		s = { "<cmd>SymbolsOutline<cr>", "Toggle SymbolsOutline" },
		t = { "<cmd>FloatermNew --autoclose=2<cr>", "New Floaterm" },
		z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
	},
	o = {
		name = "open",
		f = { "<cmd>lua MiniFiles.open()<cr>", "Open mini filemanager" },
		l = { "<cmd>Lazy<cr>", "Lazy" },
		o = {
			name = "Octo",
			p = {
				name = "GitHub pull requests",
				b = { "<cmd>Octo pr browser<cr>", "Go to a browser" },
				c = { "<cmd>Octo pr create<cr>", "Create PR" },
				C = { "<cmd>Octo pr checkout<cr>", "Checkout PR" },
				d = { "<cmd>Octo pr close<cr>", "Close PR" },
				l = { "<cmd>Octo pr list<cr>", "List of PRs" },
				m = { "<cmd>Octo pr commits<cr>", "List of commits in PR" },
			},
		},
		t = { "<cmd>ToggleTerm<cr>", "Open terminal" },
		T = { "<cmd>ToggleTerm direction=float<cr>", "Open terminal" },
		-- T = {
		--     name = "Treesitter",
		--     p = { "<cmd>TSPlaygroundToggle<cr>", "Toogle Treesitter playground" },
		--     t = { "<cmd>InspectTree<cr>", "Toogle Treesitter inspect tree" },
		-- },
	},
	r = {
		name = "Run/Reload",
		c = { "<cmd>Telescope commands<cr>", "Command" },
		h = { "<cmd>Telescope command_history<cr>", "Command history" },
		d = { "<cmd>lua require'dap'.continue()<cr>", "Debugger" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in buffer" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		d = { "<cmd>TodoTelescope<cr>", "Todos Telescope" },
		e = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
		P = { "<cmd>Telescope builtin<cr>", "Telescope builtin pickers" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		T = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
	},
	t = {
		name = "Toggle",
		c = { "<cmd>Copilot disable<cr>", "Disable Copilot" },
		d = {
			"<cmd>TroubleToggle document_diagnostics<cr>",
			"Document diagnostic",
		},
		f = { "<cmd>AutoformatToggle<cr>", "Toggle Autoformat" },
		h = {
			"<cmd>lua vim.diagnostic.hide()<cr>",
			"Hide diagnostics",
		},
		l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
		L = { "<cmd>set list!<cr>", "Listmode" },
		w = {
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			"Workspace diagnostics",
		},
		o = { "<cmd>TodoTrouble<cr>", "Todos trouble" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "LSP References" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
	},
	w = {
		name = "Window",
		["="] = { "<c-w>=", "Equally size" },
		["\\"] = { "<cmd>:vsplit<cr>", "Vertical split" },
		["-"] = { "<cmd>:split<cr>", "Horizontal split" },
		d = { "<cmd>:q<cr>", "Close" },
		q = { "<cmd>:q<cr>", "Close" },
		s = { "<cmd>:split<cr>", "Horizontal split" },
		t = { "<c-w>t", "Move to new tab" },
		v = { "<cmd>:vsplit<cr>", "Vertical split" },
		w = { "<c-w><c-w>", "Next window" },
	},
	x = {
		name = "LanguageTool",
		c = { "<cmd>GrammarousCheck<cr>", "Grammar check" },
		i = { "<Plug>(grammarous-open-info-window)", "Open the info window" },
		r = { "<Plug>(grammarous-reset)", "Reset the current check" },
		f = { "<Plug>(grammarous-fixit)", "Fix the error under the cursor" },
		x = {
			"<Plug>(grammarous-close-info-window)",
			"Close the information window",
		},
		e = {
			"<Plug>(grammarous-remove-error)",
			"Remove the error under the cursor",
		},
		n = {
			"<Plug>(grammarous-move-to-next-error)",
			"Move cursor to the next error",
		},
		p = {
			"<Plug>(grammarous-move-to-previous-error)",
			"Move cursor to the previous error",
		},
		d = {
			"<Plug>(grammarous-disable-rule)",
			"Disable the grammar rule under the cursor",
		},
	},
	z = {
		name = "Spelling",
		n = { "]s", "Next" },
		p = { "[s", "Previous" },
		a = { "zg", "Add word" },
		f = { "1z=", "Use 1. correction" },
		l = { "<cmd>Telescope spell_suggest<cr>", "List corrections" },
	},
}, { prefix = "<leader>", mode = "n", default_options })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- LuaSnip
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		vim.api.nvim_feedkeys(t("<C-n>"), "m", false)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-e>", function()
	if require("luasnip").expandable() then
		require("luasnip").expand()
	else
		require("cmp").confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		})
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-o>", function()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end, {})

vim.keymap.set({ "i", "s" }, "<C-S-o>", function()
	if luasnip.jumpable(1) then
		luasnip.jump(-1)
	end
end, {})

-- TODO: Zmienić mapping, ten jest na strzałkę w prawo
-- vim.keymap.set({ "i", "s" }, "<C-l>", function()
--     if luasnip.choice_active() then
--         luasnip.change_choice(1)
--     end
-- end, {})
