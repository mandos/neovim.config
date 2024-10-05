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
	s(
		"fn",
		fmt(
			[[
            func {}({}) {} {{
                {}
            }}
            ]],
			{ i(1, "name"), i(2), i(3, "return"), i(0) }
		)
	),
	s(
		"ee",
		fmt(
			[[
            {} = {}
            if {} != nil {{
                log.Fatal("{}", {})
            }}
            ]],
			{ i(1, "err"), i(2, "call"), rep(1), i(3, "Error msg"), rep(1) }
		)
	),
	s(
		"ve",
		fmt(
			[[
            {}, {} := {}
            if {} != nil {{
                log.Fatal("{}", {})
            }}
            ]],
			{ i(1, "val"), i(2, "err"), i(3, "call"), rep(2), i(4, "Error msg"), rep(2) }
		)
	),
}

return M
