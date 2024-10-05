local M = {}

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

M = {
	s("lr", fmt("local {} = require('{}')", { i(1), rep(1) })),
	s("lv", fmt("local {} = {}", { i(1, "variable"), i(2, "value") })),
	s(
		"fn",
		fmt(
			[[
            function {}({})
                {}
            end
            ]],
			{ i(1, "name"), i(2), i(0) }
		)
	),
	s(
		"lf",
		fmt(
			[[
            local function {}({})
                {}
            end
            ]],
			{ i(1, "name"), i(2), i(0) }
		)
	),
	s(
		"describe",
		fmt(
			[[
            describe("{}", function()
                {}
            end)
            ]],
			{ i(1, "what"), i(0) }
		)
	),
	s(
		"it",
		fmt(
			[[
            it("{}", function()
                {}
            end)
            ]],
			{ i(1, "do what?"), i(0) }
		)
	),
	s(
		"ls",
		fmt(
			[=[
            s(
                "{}",
                fmt(
                    [[
                        {}
                    ]],
                    {{{}}}
                )
            ),
            ]=],
			{ i(1, "trigger"), i(2), i(3) }
		)
	),
	s("nd", fmt("vim.notify(vim.inspect({}))", { i(1, "var") })),
	s("rqa", fmt("local assert = require('luassert')\n", {})),
}

return M
