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
	s("php", fmt("<?php\ndeclare(strict_types=1);\n\n", {})),
	s(
		"f",
		fmt(
			[[
            function {}({}):{} {{
                {}
            }}
            ]],
			{ i(1, "name"), i(2), i(3, "return"), i(0) }
		)
	),
	s(
		"choice",
		fmt(
			[[
                {}
            ]],
			{ c(1, { t(""), t("public "), t("protected "), t("private ") }) }
		)
	),
	s(
		"fe",
		fmt(
			[[
            foreach (${} as ${}) {{
                {}
            }}
            {}
            ]],
			{ i(1, "table"), i(2, "value"), i(3), i(0) }
		)
	),
}

return M
